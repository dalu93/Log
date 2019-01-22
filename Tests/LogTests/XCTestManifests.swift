import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(LoggerTests.allTests),
        testCase(LogLevelTests.allTests),
    ]
}
#endif
