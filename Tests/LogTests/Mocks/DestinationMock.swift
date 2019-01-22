@testable import Log

final class DestinationMock: LogDestination {
    var latestLog: String?

    func log(_ message: @autoclosure () -> String) {
        latestLog = message()
    }
}
