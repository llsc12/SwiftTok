
import Foundation

public class Client: ObservableObject {
    
    @Published var clientIsWorking = false
    
    init() {
        // first check
        Task {
            do {
                var req = URLRequest(url: UrlBuilders.main)
                req.appendingTitKokHeaders()
                let (_, res) = try await URLSession.shared.data(for: req)
                guard let res = res as? HTTPURLResponse else { return }
                guard !(res.statusCode != 200) else { return }
                self.clientIsWorking = true
            } catch {}
        }
    }
    
    public func getVideo(with id: String) async throws -> TikTokVideo {
        let url = UrlBuilders.videoUrl(with: id)
        var req = URLRequest(url: url)
        req.appendingTitKokHeaders()
        let (data, res) = try await URLSession.shared.data(for: req)
        guard let res = res as? HTTPURLResponse else { throw "Couldn't read headers" }
        guard !(res.statusCode != 200) else { throw "Video html request returned status code that wasn't 200" }
        guard let dataText = String(data: data, encoding: .utf8) else { throw "Couldn't make string from video html" }
        guard let matched = dataText.wholeMatch(of: sigiState) else { throw "No matches for sigi state in video html" }
        guard let subStr = matched[1].substring else { throw "No 2nd match for sigi state"}
        guard let windowFirst = "\(subStr)".dropFirst(21).components(separatedBy: "window[").first,
              let object = windowFirst.components(separatedBy: "};").first else { throw "Object Creation failed" }
        guard let itemMatch = object.wholeMatch(of: moduleThing) else { throw "No matches for module in video html" }
        
        print(itemMatch[1])
        throw "gm"
    }
}
