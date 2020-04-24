//
//  Copyright © 2016 - 2018 Werner Freytag. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    @discardableResult mutating func remove(_ object: Element) -> Element? {
        guard let index = firstIndex(of: object) else { return nil }
        return remove(at: index)
    }
}

public extension Array where Element: NSObject {
    /// Filter an array by an NSPredicate
    func filter(_ predicate: NSPredicate) -> [Iterator.Element] {
        return (self as NSArray).filtered(using: predicate) as! [Iterator.Element]
    }
}

public extension Array where Element: Hashable {
    /// returns only unque elements of an array of hashable elements
    func uniqueElements() -> [Element] {
        var single = Set<Element>()
        return filter { single.insert($0).inserted }
    }
}

public extension Array where Element: Equatable {
    /// Remove duplicate elements of an array
    mutating func removeDuplicateElements() {
        self = uniqueElements()
    }

    /// Intersect array with another array
    func intersection(_ array: [Element]) -> [Element] {
        return filter { array.contains($0) }
    }

    /// returns only unque elements of an array
    func uniqueElements() -> [Element] {
        var resultArray: [Element] = []
        for element in self where !resultArray.contains(element) {
            resultArray.append(element)
        }

        return resultArray
    }
}

/// Use "-" to substract arrays by element
public func - <T: Equatable>(lhs: [T], rhs: [T]) -> [T] {
    return lhs.filter { !rhs.contains($0) }
}

/// Use "-=" to remove elements from an array
public func -= <T: Equatable>(lhs: inout [T], rhs: [T]) {
    lhs = lhs - rhs
}

extension Array where Element: Equatable {
    private func adaptLength<T: RandomAccessCollection>(with other: T) -> ArraySlice<Element> {
        return prefix(Swift.min(count, other.count))
    }

    /// Find common prefix with another array
    public func commonPrefix<T: RandomAccessCollection>(with other: T) -> T.SubSequence
        where T.Element == Element, T.Index == Index {
        let array = adaptLength(with: other)
        let prefixCnt = array.enumerated().first { $0.1 != other[$0.0] }?.offset ?? array.endIndex

        return other[..<prefixCnt]
    }

    /// Find common suffix with another array
    public func commonSuffix<T: RandomAccessCollection>(with other: T) -> T.SubSequence
        where T.Element == Element, T.Index == Index {
        let array = reversed().adaptLength(with: other)
        let cnt = other.count
        let prefixCnt = array.enumerated().first { $0.1 != other[cnt - $0.0 - 1] }?.offset ?? array.endIndex

        return other[(cnt - prefixCnt)...]
    }
}

extension Array where Element: Equatable {
    /// Returns the smallest slice of elements that can be repeated to form the array
    public var leastCommonSlice: ArraySlice<Element>? {
        let count = self.count
        guard count > 1 else { return nil }

        var partition: ArraySlice<Element>?

        guard (1 ... count / 2).first(where: { partitionSize in
            guard count % partitionSize == 0 else { return false }

            partition = self[0 ..< partitionSize]
            let numberOfPartitions = count / partitionSize

            return (1 ..< numberOfPartitions).first(where: { iteration in
                let offset = partitionSize * iteration
                return partition != self[offset ..< offset + partitionSize]
            }) == nil

        }) != nil else {
            return nil
        }

        return partition
    }
}

// MARK: Search and replace

extension Array where Element: Equatable {
    /// Returns the indices of the given slice in the array, non-overlapping
    public func indices(of slice: ArraySlice<Element>) -> [Int] {
        var indices: [Int] = []
        let sliceLength = slice.count
        var fromOffset = 0
        while fromOffset <= count - sliceLength {
            if self[fromOffset ..< fromOffset + sliceLength] == slice {
                indices.append(fromOffset)
                fromOffset += sliceLength
            } else {
                fromOffset += 1
            }
        }

        return indices
    }

    /// Replace a slice in one array with another slice
    public func replacing(_ search: ArraySlice<Element>, with replacement: ArraySlice<Element>) -> [Element] {
        var result: [Element] = []

        var fromOffset = 0
        for index in indices(of: search) {
            result.append(contentsOf: self[fromOffset ..< index])
            fromOffset = index + search.count
            result.append(contentsOf: replacement)
        }

        result.append(contentsOf: self[fromOffset...])

        return result
    }
}
