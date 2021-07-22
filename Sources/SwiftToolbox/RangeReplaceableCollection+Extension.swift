//
//  Copyright © 2020 Werner Freytag. All rights reserved.
//

import Foundation

public extension RangeReplaceableCollection where Element: Equatable, Index == Int, SubSequence: Equatable {
    /// Replace a slice in one collection with another one
    func replacingOccurrences(of search: SubSequence, with replacement: SubSequence) -> Self {
        var result = self
        for range in ranges(of: search).reversed() {
            result.replaceSubrange(range, with: replacement)
        }

        return result
    }
}

public extension RangeReplaceableCollection {
    /// Move a part of the collection specified by a range to another position
    func moving(range: Range<Index>, to toPosition: Index) -> Self {
        let shiftedRanges: [Range<Index>] = {
            switch true {
            case range.contains(toPosition):
                return [startIndex ..< endIndex] // no changes

            case range.lowerBound < toPosition:
                return [
                    startIndex ..< range.lowerBound, // content before
                    range.upperBound ..< toPosition, // content shifted to the left
                    range.lowerBound ..< range.upperBound, // shifted part
                    toPosition ..< endIndex, // rest
                ]

            default:
                return [
                    startIndex ..< toPosition, // content before
                    range.lowerBound ..< range.upperBound, // shifted part
                    toPosition ..< range.lowerBound, // content shifted to the right
                    range.upperBound ..< endIndex, // rest
                ]
            }
        }()

        return Self(shiftedRanges.map { self[$0] }.joined())
    }
}
