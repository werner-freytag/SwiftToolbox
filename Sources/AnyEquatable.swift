//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Foundation

public protocol AnyEquatableWrappable {
    func isEqual(to other: AnyEquatableWrappable) -> Bool
    var asEquatable: AnyEquatable { get }
}

public extension AnyEquatableWrappable where Self: Equatable {
    func isEqual(to other: AnyEquatableWrappable) -> Bool {
        guard let other = other as? Self else { return false }
        return self == other
    }
    
    var asEquatable: AnyEquatable {
        return AnyEquatable(self)
    }
}

public struct AnyEquatable {
    fileprivate let object: AnyEquatableWrappable
    
    init(_ object: AnyEquatableWrappable) {
        self.object = object
    }
}

extension AnyEquatable: Equatable {
    public static func ==(lhs: AnyEquatable, rhs: AnyEquatable) -> Bool {
        return lhs.object.isEqual(to: rhs.object)
    }
}
