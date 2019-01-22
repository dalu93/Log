# Log 📝

Lightweight, pluggable, pure Swift logging library

## Installation

You can install Log 📝 with SPM

1. Add or amend a `Package.swift`
2. Add this dependency
   `.package(url: "https://github.com/dalu93/Log.git", from: "0.1.0")`
3. Then import `Log` in your code and start using it 🎉

## Usage

```swift
log.error("something wrong happened")
```

Easy right? By **default**, Log comes with a set of
`LogLevel`s which should cover, more or less, all the use
cases: `debug`, `info`, `notice`, `warning` and `error`. It
also provides few utility methods that you can access as
below:

```swift
log.debug("message", isVerbose: true)
log.info("message")
log.notice("message")
log.warning("message")
log.error("message")
```

### Destinations

By using the default `log` instance, your logs are going to
be sent to terminal output. If you want to change this
behavior, define your own `Destination` by confirming to
`LogDestination` protocol

```swift
struct LocalFileDestination: LogDestination {
    func log(_ message: @autoclosure () -> String) {
        // log to file here...
    }
}
```

And then, initialize your own `Logger` instance

```swift
let logger = Logger(
    destinations: [
        LocalFileDestination(),
        TerminalDestination()
    ],
    isVerbose: false
)
```

This code will send the logs to each `LogDestination` which
is passed to the `Logger` instance.
