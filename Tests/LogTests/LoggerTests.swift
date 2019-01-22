import XCTest
@testable import Log

final class LoggerTests: XCTestCase {
    let message = "some message"
    let destination = DestinationMock()
    var logger: Logger!

    override func setUp() {
        super.setUp()

        logger = Logger(
            destinations: [destination],
            isVerbose: true
        )

        destination.latestLog = nil
    }

    func testProperMessageIsSentToDestination() {
        let expectedMessage = "[ERROR] " + message
        logger.error(message)
        XCTAssertEqual(expectedMessage, destination.latestLog)
    }

    func testThatIsVerboseFromLoggerCanBeOverwritten() {
        logger.debug(message, isVerbose: false)
        XCTAssertNil(destination.latestLog)
    }

    func testThatMessageIsSentToDestinationThroughGeneralFunction() {
        let expectedMessage = "[DEBUG] " + message
        logger.log(message, level: .debug)
        XCTAssertEqual(expectedMessage, destination.latestLog)
    }

    static var allTests = [
        ("testProperMessageIsSentToDestination", testProperMessageIsSentToDestination),
        ("testThatIsVerboseFromLoggerCanBeOverwritten", testThatIsVerboseFromLoggerCanBeOverwritten),
        ("testThatMessageIsSentToDestinationThroughGeneralFunction", testThatMessageIsSentToDestinationThroughGeneralFunction)
    ]
}
