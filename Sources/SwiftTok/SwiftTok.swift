
import Foundation
import SwiftSoup

public class Client: ObservableObject {
    
    @Published var clientIsWorking = false
    
    let decoder = JSONDecoder()
    
    public init() {
        // first check just in case you want it
        Task {
            do {
                var req = URLRequest(url: UrlBuilders.main)
                req.appendingTitKokHeaders()
                let (_, res) = try await URLSession.shared.data(for: req)
                guard let res = res as? HTTPURLResponse else { return }
                guard !(res.statusCode != 200) else { return }
                DispatchQueue.main.async {
                    self.clientIsWorking = true
                }
            } catch {}
        }
    }
    
    public func getVideoData(with id: String) async throws -> TikTokVideo {
        guard let url = try? UrlBuilders.videoUrl(with: id) else { throw "ID is invalid" }
        return try await rawVideoData(url)
    }
    
    public func getVideoData(for url: URL) async throws -> TikTokVideo {
        guard let url = try? Sanitisers.sanitiseUrl(url.absoluteString) else { throw "Couldn't sanitise tiktok url" }
        return try await rawVideoData(url)
    }
    
    @available(*, deprecated, message: "Don't use this it makes random files on your desktop its not ready yet")
    public func getLiveStream(_ username: String) async throws {
        let url = try UrlBuilders.streamUrl(username)
        let html = try await rawHtmlDoc(url)
        let sigistate = try html.getSigiState()
        
        try sigistate.write(to: .desktopDirectory.appending(path: "e").appendingPathExtension("json"), atomically: true, encoding: .utf8)
    }
    
    // MARK: - Internal raw stuff
    
    internal func rawHtmlDoc(_ url: URL) async throws -> Document {
        var req = URLRequest(url: url)
        req.appendingTitKokHeaders()
        let (data, res) = try await URLSession.shared.data(for: req)
        guard let res = res as? HTTPURLResponse else { throw "Couldn't read headers" }
        guard !(res.statusCode != 200) else { throw "html request returned status code that wasn't 200" }
        guard let dataText = try? data.decodeToString() else { throw "Couldn't make string from html" }
        let html = try SwiftSoup.parse(dataText, url.absoluteString)
        
        return html
    }
    
    internal func rawVideoData(_ url: URL) async throws -> TikTokVideo {
        let html = try await rawHtmlDoc(url)
        let sigistate = try html.getSigiState()
        
        guard let snip1 = sigistate.components(separatedBy: "ItemModule\":").last else { throw "Snipping error in sigi state" }
        guard let snip2 = snip1.components(separatedBy: ",\"UserModule").first else { throw "Snipping error in sigi state" }
        let final = snip2.dropFirst(23).dropLast(1)
        guard let data = final.data(using: .utf8) else { throw "Couldn't turn json string into data for decoding"}
        // i promise im not proud of this
        
        print(final)
        let decoded = try decoder.decode(TikTokVideo.self, from: data)
        return decoded
    }
}



fileprivate extension Document {
    func getSigiState() throws -> String {
        guard let sigiState = try? self.select("#SIGI_STATE").first() else { throw "Query for sigi state failed in video html" }
        guard let str = try? sigiState.html() else { throw "Couldn't stringify sigi state" }
        return str
    }
}

fileprivate extension Data {
    func decodeToString() throws -> String {
        let data = self
        guard let text = String(data: data, encoding: .utf8) else {
            throw "Failed to decode as string"
        }

        let transform = StringTransform(rawValue: "Any-Hex/Java")
        return text.applyingTransform(transform, reverse: true) ?? text
    }
}
