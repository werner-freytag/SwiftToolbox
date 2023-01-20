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

public func cartesian<T1: Sequence, T2: Sequence>(_ lhs: T1, _ rhs: T2) -> some Sequence<(T1.Element, T2.Element)> {
    lhs.lazy.flatMap { x in rhs.lazy.map { y in (x, y) } }
}

public extension Sequence where Element: Hashable {
    /// Check if the sequence contains duplicates comparing the elements
    @inlinable func hasDuplicates() -> Bool {
        hasDuplicates(on: { $0 })
    }
}

public extension Sequence {
    /// Check if the sequence contains duplicates
    ///
    /// - Parameter projection: A closure that transforms an element into the
    ///   value to use for uniqueness. If `projection` returns the same value for
    ///   two different elements, the second element will be excluded from the
    ///   resulting array.
    ///
    /// - Returns: true if there are duplicates
    @inlinable func hasDuplicates<Subject: Hashable>(on projection: (Element) throws -> Subject) rethrows -> Bool {
        var seen: Set<Subject> = []
        for element in self where !seen.insert(try projection(element)).inserted {
            return true
        }
        return false
    }
}
