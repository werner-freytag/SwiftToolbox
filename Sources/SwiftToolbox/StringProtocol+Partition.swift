//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Foundation

extension StringProtocol where Index == String.Index {
    /**
     Returns an array with all possibilities to split the string.
     */
    public func partition() -> [[Self.SubSequence]] {
        guard !isEmpty else { return [] }

        var memoized = [Self.SubSequence: [[Self.SubSequence]]]()

        func partition(_ string: Self.SubSequence) -> [[Self.SubSequence]] {
            if let result = memoized[string] { return result }

            let indices = string[..<string.index(before: string.endIndex)].indices
            let result = [[string]] + indices.reversed().flatMap { index -> [[Self.SubSequence]] in
                let firstPart = string[...index]
                return partition(string[string.index(after: index)...]).map { [firstPart] + $0 }
            }
            memoized[string] = result

            return result
        }

        return partition(self[startIndex...])
    }
}
