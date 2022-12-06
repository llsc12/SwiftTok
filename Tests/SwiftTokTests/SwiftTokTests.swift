import XCTest
@testable import SwiftTok

final class SwiftTokTests: XCTestCase {
    func testExample() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let client = SwiftTok.Client()
        let _ = try await client.getVideo(with: "ZMFqj7rpQ")
    }
}
