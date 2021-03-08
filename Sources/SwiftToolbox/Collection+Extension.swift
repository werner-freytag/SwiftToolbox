//
//  Copyright © 2019, 2020 Werner Freytag. All rights reserved.
//

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public extension Collection {
    /// Find common prefix with another collection
    func commonPrefix<T: Collection>(with other: T, isEqual: (T.Element, T.Element) -> Bool) -> SubSequence where T.Element == Self.Element, T.Index == Self.Index {
        guard startIndex == other.startIndex else { return self[startIndex ..< startIndex] }

        let endIndex: Self.Index = {
            guard let endIndex = self.indices.first(where: { index in
                guard index < other.endIndex else { return true }
                return !isEqual(self[index], other[index])
            }) else {
                return Swift.min(self.endIndex, other.endIndex)
            }

            return endIndex
        }()

        return self[..<endIndex]
    }

    /// Find common suffix with another collection
    func commonSuffix<T: Collection>(with other: T, isEqual: (T.Element, T.Element) -> Bool) -> SubSequence where T.Element == Self.Element, T.Index == Self.Index {
        let length = reversed().commonPrefix(with: other.reversed(), isEqual: isEqual).count

        return self[index(startIndex, offsetBy: count - length)...]
    }
}

public extension Collection where Element: Equatable {
    /// Find common prefix with another collection
    func commonPrefix<T: Collection>(with other: T) -> SubSequence where T.Element == Self.Element, T.Index == Self.Index {
        return commonPrefix(with: other, isEqual: ==)
    }

    /// Find common suffix with another collection
    func commonSuffix<T: Collection>(with other: T) -> SubSequence where T.Element == Self.Element, T.Index == Self.Index {
        return commonSuffix(with: other, isEqual: ==)
    }
}

public extension Collection where Element: Equatable, Index == Int, SubSequence: Equatable {
    func ranges(of slice: SubSequence) -> [Range<Index>] {
        Array(rangeIterator(of: slice))
    }

    /// Returns the ranges of the given slice in the array, non-overlapping
    func firstRange(of slice: SubSequence) -> Range<Index>? {
        for range in rangeIterator(of: slice) { return range }
        return nil
    }

    internal func rangeIterator(of slice: SubSequence) -> AnyIterator<Range<Index>> {
        let sliceLength = slice.count
        var fromOffset = startIndex

        return AnyIterator {
            while fromOffset <= self.count - sliceLength {
                guard self[fromOffset ..< fromOffset.advanced(by: sliceLength)] == slice else {
                    fromOffset += 1
                    continue
                }

                defer { fromOffset += sliceLength }
                return fromOffset ..< fromOffset.advanced(by: sliceLength)
            }

            return nil
        }
    }
}

public extension Collection where Index: SignedInteger, Index.Stride: SignedInteger {
    /// Returns sequence of all possible slices of the collection
    var allSlices: AnySequence<SubSequence> {
        AnySequence((startIndex ..< Swift.max(startIndex, endIndex)).flatMap { lowerBound in
            (lowerBound.advanced(by: 1) ... endIndex).map { upperBound in self[lowerBound ..< upperBound] }
        })
    }
}
