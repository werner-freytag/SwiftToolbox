//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Foundation

public extension Sequence {
    /// A Boolean value indicating whether the sequence is empty.
    var isEmpty: Bool {
        var iterator = makeIterator()
        return iterator.next() == nil
    }
}

public func cartesian<T1: Sequence, T2: Sequence>(_ lhs: T1, _ rhs: T2) -> AnySequence<(T1.Element, T2.Element)> {
    AnySequence(lhs.lazy.flatMap { x in rhs.lazy.map { y in (x, y) } })
}
