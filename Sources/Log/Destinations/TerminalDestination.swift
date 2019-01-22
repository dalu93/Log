import Foundation

/// Takes care of logging the messages
/// to terminal
public struct TerminalDestination: LogDestination {
    public init() {}

    /// Logs the message to terminal
    ///
    /// - Parameter message: The message to log
    public func log(_ message: @autoclosure () -> String) {
        print(message())
    }
}
