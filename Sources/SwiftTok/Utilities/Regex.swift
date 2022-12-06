
import Foundation

let sigiState = try! Regex("<script id=\"SIGI_STATE\" type=\"application/json\">(.*?)</script>")
let moduleThing = try! Regex("\"ItemModule\":({.*?}),\"UserModule\"")
