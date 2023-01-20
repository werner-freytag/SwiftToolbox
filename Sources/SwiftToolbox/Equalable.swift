//
//  Copyright © Werner Freytag. All rights reserved.
//

import Foundation

public protocol Equalable {
    func equals(_ other: Any) -> Bool
}

public extension Equalable where Self: Equatable {
    func equals(_ other: Any) -> Bool {
        guard let other = other as? Self else { return false }
        return self == other
    }
}

public struct AnyEqualable {
    let object: Equalable

    public init(_ object: Equalable) {
        self.object = object
    }
}

extension AnyEqualable: Equatable {
    public static func == (lhs: AnyEqualable, rhs: AnyEqualable) -> Bool {
        return lhs.object.equals(rhs.object)
    }
}

public extension Array {
    func firstIndex(of element: Equalable) -> Self.Index? {
        firstIndex(where: { element.equals($0) })
    }
}
