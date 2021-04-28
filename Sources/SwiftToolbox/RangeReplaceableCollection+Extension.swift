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
