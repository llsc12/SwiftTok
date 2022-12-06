
import Foundation

struct UrlBuilders {
    static let main = URL(string: "https://www.tiktok.com/")!
    static let vm = URL(string: "https://vm.tiktok.com/")!

    static func videoUrl(with id: String) -> URL {
        vm.appending(path: id)
    }
}
