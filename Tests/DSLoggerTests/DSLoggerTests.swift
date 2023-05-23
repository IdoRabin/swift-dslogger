import XCTest
@testable import DSLogger

final class DSLoggerTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DSLogger().text, "Hello, World!")
    }
}
