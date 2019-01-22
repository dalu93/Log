import Foundation

/// Provides a description of the log mode
///
/// - verbose: All the log's level should be displayed anyway
/// - silent: Only few log's level should be displayed
public enum LogMode {
    case verbose, silent

    init(isVerbose: Bool) {
        self = isVerbose ? .verbose : .silent
    }
}
