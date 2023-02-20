//
//  Copyright © Werner Freytag. All rights reserved.
//

import Foundation

/// Protocol to make objects equatable without Self dependency
public protocol Equalable {
    /// Is self equal to another object
    /// - Parameter other: some other object
    /// - Returns: true if both objects are equal
    func equals(_ other: Any) -> Bool
}

public extension Equalable where Self: Equatable {
    /// compare Equalable object with other object
    /// - Parameter other: Object to compare
    /// - Returns: true if self and other are same object an equal
    func equals(_ other: Any) -> Bool {
        guard let other = other as? Self else { return false }
        return self == other
    }
}

/// Type deleting container for Equalable objects
public struct AnyEqualable {
    let object: Equalable

    /// Constructor wrapping Equalable object
    /// - Parameter object: some Equalable object
    public init(_ object: Equalable) {
        self.object = object
    }
}

/// Make type deleted AnyEqualable equatable
extension AnyEqualable: Equatable {
    /// Compare two AnyEqualable
    public static func == (lhs: AnyEqualable, rhs: AnyEqualable) -> Bool {
        return lhs.object.equals(rhs.object)
    }
}

public extension Collection {
    /// Return first element of Equalable in collectionnd
    func firstIndex(of element: Equalable) -> Self.Index? {
        firstIndex(where: { element.equals($0) })
    }
}
