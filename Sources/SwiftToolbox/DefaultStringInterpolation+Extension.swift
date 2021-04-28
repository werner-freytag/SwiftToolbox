import Foundation

public extension DefaultStringInterpolation {
    mutating func appendInterpolation<T>(debugDescription value: T?) {
        guard let value = value else { appendInterpolation("nil"); return }

        if let debugDescription = (value as? CustomDebugStringConvertible)?.debugDescription {
            appendInterpolation(debugDescription)
        } else {
            appendInterpolation("\(value)")
        }
    }
}
