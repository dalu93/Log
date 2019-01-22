import Foundation

/// The log level
public struct LogLevel {
    /// Defines how the initial message from user
    /// changes, depending on the `LogMode` and
    /// other factors
    public let whenPrinting: (String, LogMode) -> String?

    public init(whenPrinting: @escaping (String, LogMode) -> String?) {
        self.whenPrinting = whenPrinting
    }
}

public extension LogLevel {
    /// The debug log is displayed only when
    /// the verbose mode is active
    ///
    /// Example:
    ///
    ///     [DEBUG] my message
    static let debug: LogLevel = LogLevel(
        whenPrinting: { message, mode in
            switch mode {
            case .verbose:
                return "[DEBUG] " + message

            case .silent:
                return nil
            }
        }
    )

    /// The info log displayes information
    /// for the user and the developer
    ///
    /// Example:
    ///
    ///     [INFO] my message
    static let info: LogLevel = LogLevel(
        whenPrinting: { message, _ in
            "[INFO] " + message
        }
    )

    /// The notice log tells that something is wrong,
    /// but nothing to worry about yet
    ///
    /// Example:
    ///
    ///     [NOTICE] my message
    static let notice: LogLevel = LogLevel(
        whenPrinting: { message, _ in
            "[NOTICE] " + message
        }
    )
    /// The warning log provides an efficient way
    /// to evaluate possible errors
    ///
    /// Example:
    ///
    ///     [WARNING] my message
    static let warning: LogLevel = LogLevel(
        whenPrinting: { message, _ in
            "[WARNING] " + message
        }
    )

    /// The error log notifies the user and
    /// the developer that an error occurred
    ///
    /// Example:
    ///
    ///     [ERROR] my message
    static let error: LogLevel = LogLevel(
        whenPrinting: { message, _ in
            "[ERROR] " + message
        }
    )
}
