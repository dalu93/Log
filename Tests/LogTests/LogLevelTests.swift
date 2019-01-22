import XCTest
@testable import Log

final class LogLevelTests: XCTestCase {
    let message = "some message"

    func testDebugLevelWhenIsVerbose() {
        let expectedOutput = "[DEBUG] " + message
        let output = LogLevel.debug.whenPrinting(message, .verbose)
        XCTAssertEqual(expectedOutput, output)
    }

    func testDebugLevelWhenIsSilent() {
        let output = LogLevel.debug.whenPrinting(message, .silent)
        XCTAssertNil(output)
    }

    func testInfoLevel() {
        let expectedOutput = "[INFO] " + message
        let output = LogLevel.info.whenPrinting(message, .silent)
        XCTAssertEqual(expectedOutput, output)
    }

    func testNoticeLevel() {
        let expectedOutput = "[NOTICE] " + message
        let output = LogLevel.notice.whenPrinting(message, .silent)
        XCTAssertEqual(expectedOutput, output)
    }

    func testWarningLevel() {
        let expectedOutput = "[WARNING] " + message
        let output = LogLevel.warning.whenPrinting(message, .silent)
        XCTAssertEqual(expectedOutput, output)
    }

    func testErrorLevel() {
        let expectedOutput = "[ERROR] " + message
        let output = LogLevel.error.whenPrinting(message, .silent)
        XCTAssertEqual(expectedOutput, output)
    }

    static var allTests = [
        ("testDebugLevelWhenIsVerbose", testDebugLevelWhenIsVerbose),
        ("testDebugLevelWhenIsSilent", testDebugLevelWhenIsSilent),
        ("testInfoLevel", testInfoLevel),
        ("testNoticeLevel", testNoticeLevel),
        ("testWarningLevel", testWarningLevel),
        ("testErrorLevel", testErrorLevel),
    ]
}
