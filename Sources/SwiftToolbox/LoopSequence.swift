//
//  Copyright © Werner Freytag. All rights reserved.
//

import Foundation

/// Loops forever over a sequence
public struct LoopSequence<Base: Sequence>: Sequence {
    private var collection: Base

    /// Initialize from collection
    /// - Parameter collection: Collection to wrap
    public init(_ collection: Base) {
        self.collection = collection
    }

    public func makeIterator() -> AnyIterator<Base.Iterator.Element> {
        var iterator: Base.Iterator?

        return AnyIterator {
            if let element = iterator?.next() {
                return element
            }

            iterator = self.collection.makeIterator()
            return iterator?.next()
        }
    }
}
