//
//  Copyright © 2020 Werner Freytag. All rights reserved.
//

import Foundation

extension RandomAccessCollection where Element: Equatable, Index == Int, SubSequence: Equatable {
    /// Returns the smallest slice of elements that can be repeated to form the array
    public var leastCommonSlice: SubSequence? {
        let count = self.count
        guard count > 1 else { return nil }

        var partition: SubSequence?

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

extension RandomAccessCollection where Element: Equatable, Index == Int, SubSequence: Equatable {
    /// Returns the indices of the given slice in the array, non-overlapping
    public func ranges(matching slice: SubSequence) -> [Range<Index>] {
        var indices: [Range<Index>] = []
        let sliceLength = slice.count
        var fromOffset = startIndex
        while fromOffset <= count - sliceLength {
            if self[fromOffset ..< fromOffset.advanced(by: sliceLength)] == slice {
                indices.append(fromOffset ..< fromOffset.advanced(by: sliceLength))
                fromOffset += sliceLength
            } else {
                fromOffset += 1
            }
        }

        return indices
    }

    /// Replace a slice in one array with another slice
    public func replacingOccurrences(of search: SubSequence, with replacement: SubSequence) -> [Element] {
        var result: [Element] = []

        var fromOffset = startIndex
        for range in ranges(matching: search) {
            result.append(contentsOf: self[fromOffset ..< range.lowerBound])
            fromOffset = range.upperBound
            result.append(contentsOf: replacement)
        }

        result.append(contentsOf: self[fromOffset...])

        return result
    }
}
