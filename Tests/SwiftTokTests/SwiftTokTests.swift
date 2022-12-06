import XCTest
@testable import SwiftTok

final class SwiftTokTests: XCTestCase {
    
    let testVideosById: [String] = [
        "ZMFqj7rpQ",
        "ZMFq9c6bW",
    ]
    
    let testVideosByUrl: [String] = [
        "https://vm.tiktok.com/ZMFqj7rpQ",
        "https://vm.tiktok.com/ZMFq9c6bW",
//        "https://www.tiktok.com/7155899472973712646", it turns out this is invalid lmao
        "https://www.tiktok.com/@smg4official/video/7168704240532131073?is_from_webapp=1&sender_device=pc"
    ]
    
    func testVideosById() async throws {
        let client = SwiftTok.Client()
        
        var error = false
        
        for id in testVideosById {
            do {
                let _ = try await client.getVideo(with: id)
            } catch(let err) {
                error = true
                print("[SwiftTokTests] [\(id)] \(err)")
            }
        }
        
        if error {
            throw "[SwiftTokTests] Check console for issues"
        }
    }
    
    func testVideosByUrl() async throws {
        let client = SwiftTok.Client()
        
        var error = false
        
        for url in testVideosByUrl {
            do {
                guard let url = URL(string: url) else { continue }
                let _ = try await client.getVideo(for: url)
            } catch(let err) {
                error = true
                print("[SwiftTokTests] [\(url)] \(err)")
            }
        }
        
        if error {
            throw "[SwiftTokTests] Check console for issues"
        }
    }
    
    func testSanitise() throws {
        var error = false
        
        for url in testVideosByUrl {
            do {
                let egg = try UrlBuilders.sanitiseUrl(url)
                print("[SwiftTokTests] Success! \(egg)")
            } catch(let err) {
                error = true
                print("[SwiftTokTests] [\(url)] \(err)")
            }
        }
        
        if error {
            throw "[SwiftTokTests] Check console for issues"
        }
    }
}
