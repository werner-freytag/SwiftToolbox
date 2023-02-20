//
//  Copyright © Werner Freytag. All rights reserved.
//

import Foundation

public extension DefaultStringInterpolation {
    /// Append a value to the string interpolation
    /// - Parameter value: some value
    mutating func appendInterpolation<T>(debugDescription value: T?) {
        guard let value = value else { appendInterpolation("nil"); return }

        if let debugDescription = (value as? CustomDebugStringConvertible)?.debugDescription {
            appendInterpolation(debugDescription)
        } else {
            appendInterpolation("\(value)")
        }
    }
}
