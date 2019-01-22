import Foundation

/// A log destination
public protocol LogDestination {
    func log(_ message: @autoclosure () -> String)
}
