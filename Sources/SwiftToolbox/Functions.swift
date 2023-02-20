//
//  Copyright © Werner Freytag. All rights reserved.
//

import Foundation

/// Exceptions to be thrown when cast fails
public enum CastError: Error {
    /// Casting failed
    case notCastable
}

/// Casts a value to the expected type and throws an error if this is not possible. This way you replace a fatal with an error
public func cast<T>(_ value: Any?) throws -> T {
    guard let value = value as? T else { throw CastError.notCastable }
    return value
}
