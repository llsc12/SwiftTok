
import Foundation

extension URLRequest {
    mutating func appendingTitKokHeaders() {
        self.allHTTPHeaderFields = tiktokheaders
    }
}
