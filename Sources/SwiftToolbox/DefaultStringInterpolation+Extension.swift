import Foundation

public extension DefaultStringInterpolation {
    mutating func appendInterpolation<T>(debugDescription value: T) {
        if let debugDescription = (value as? CustomDebugStringConvertible)?.debugDescription {
            appendInterpolation(debugDescription)
        } else {
            appendInterpolation("\(value)")
        }
    }
}
