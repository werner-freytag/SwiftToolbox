//
//  Copyright © 2020 Werner Freytag. All rights reserved.
//

import Foundation

public enum CastError: Error {
    case notCastable
}

/// Casts a value to the expected type and throws an error if this is not possible. This way you replace a fatal with an error
public func cast<T>(_ value: Any?) throws -> T {
    guard let value = value as? T else { throw CastError.notCastable }
    return value
}
