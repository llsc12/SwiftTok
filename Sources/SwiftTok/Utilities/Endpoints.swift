
import Foundation
import RegexBuilder

struct UrlBuilders {
    static let main = URL(string: "https://www.tiktok.com/")!
    static let vm = URL(string: "https://vm.tiktok.com/")!
    
    static func videoUrl(with id: String) throws -> URL {
        if let _ = id.wholeMatch(of: shortIdRegex) {
            return vm.appending(path: id)
        } else if let _ = id.wholeMatch(of: longIdRegex) {
            return main.appending(path: id)
        }
        throw "Invalid id"
    }
    
    static func sanitiseUrl(_ str: String) throws -> URL {
        if let match = str.wholeMatch(of: shortUrlRegex) {
            let id = match.output.1
            return vm.appending(path: id)
        } else if let match = str.wholeMatch(of: longUrlRegex) {
            let id = match.output.2
            if let user = match.output.1 {
                return main.appending(path: "@\(user)").appending(path: "video").appending(path: id)
            } else {
                throw "Failed to make long format url, need user account name"
            }
        } else {
            throw "Failed to validate"
        }
    }
}


// https:\/\/www.tiktok.com\/(?:@([A-z0-9_.]{2,28})\/video\/)?([0-9]{19})\/?.*
let longUrlRegex = Regex {
    "https://www.tiktok.com/"
    Optionally {
        Regex {
            "@"
            Capture {
                Repeat(2...28) {
                    CharacterClass(
                        .anyOf("_."),
                        ("A"..."z"),
                        ("0"..."9")
                    )
                }
            }
            "/video/"
        }
    }
    Capture {
        Repeat(count: 19) {
            ("0"..."9")
        }
    }
    Optionally {
        "/"
    }
    ZeroOrMore(.anyNonNewline)
}

// https:\/\/vm.tiktok.com\/([A-z0-9]{9})\/?.*
let shortUrlRegex = Regex {
    "https://vm.tiktok.com/"
    Capture {
        Repeat(count: 9) {
            CharacterClass(
                ("A"..."z"),
                ("0"..."9")
            )
        }
    }
    Optionally {
        "/"
    }
    ZeroOrMore(.anyNonNewline)
}
    .anchorsMatchLineEndings()

let longIdRegex = Capture {
    Repeat(count: 19) {
        ("0"..."9")
    }
}

let shortIdRegex = Regex {
    Repeat(count: 9) {
        CharacterClass(
            ("A"..."z"),
            ("0"..."9")
        )
    }
}
    .anchorsMatchLineEndings()
