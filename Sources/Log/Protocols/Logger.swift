import Foundation

// MARK: - Logger

/// `Logger` is the main structure which is
/// responsible for processing the message
/// and routing it to all destinations set
public struct Logger {
    /// A set of destinations to which send the log
    public let destinations: [LogDestination]

    /// Verbose logging or not
    public let isVerbose: Bool

    /// Initializes a new `Logger` instance.
    ///
    /// You can initialize as many `Logger` instances
    /// as you want.
    ///
    /// - Parameters:
    ///   - destinations: The destinations
    ///   - isVerbose: Verbose logging or not
    public init(
        destinations: [LogDestination] = [TerminalDestination()],
        isVerbose: Bool = true
    ) {
        self.destinations = destinations
        self.isVerbose = isVerbose
    }

    /// Basic logging functionality
    ///
    /// - Parameters:
    ///   - message: The message to log
    ///   - level: The log's level
    ///   - isVerbose: Whether is verbose or not. If `nil`,
    ///     it takes the `Logger` instance value
    public func log(
        _ message: @autoclosure () -> String,
        level: LogLevel,
        isVerbose: Bool? = nil
    ) {
        let mode = LogMode(isVerbose: isVerbose ?? self.isVerbose)
        guard let processedMessage = level.whenPrinting(message(), mode) else {
            return
        }

        destinations.forEach {
            $0.log(processedMessage)
        }
    }
}

// MARK: - Public utils

extension Logger {
    /// Sends a log message with `.debug` as log's level
    ///
    /// - Parameters:
    ///   - message: The message to log
    ///   - isVerbose: Whether is verbose or not. If `nil`,
    ///     it takes the `Logger` instance value
    public func debug(
        _ message: @autoclosure () -> String,
        isVerbose: Bool? = nil
    ) {
        log(
            message,
            level: .debug,
            isVerbose: isVerbose
        )
    }

    /// Sends a log message with `.info` as log's level
    ///
    /// - Parameter message: The message to log
    public func info(_ message: @autoclosure () -> String) {
        log(
            message,
            level: .info,
            isVerbose: isVerbose
        )
    }

    /// Sends a log message with `.notice` as log's level
    ///
    /// - Parameter message: The message to log
    public func notice(_ message: @autoclosure () -> String) {
        log(
            message,
            level: .notice,
            isVerbose: isVerbose
        )
    }

    /// Sends a log message with `.warning` as log's level
    ///
    /// - Parameter message: The message to log
    public func warning(_ message: @autoclosure () -> String) {
        log(
            message,
            level: .warning,
            isVerbose: isVerbose
        )
    }

    /// Sends a log message with `.error` as log's level
    ///
    /// - Parameter message: The message to log
    public func error(_ message: @autoclosure () -> String) {
        log(
            message,
            level: .error,
            isVerbose: isVerbose
        )
    }
}
