//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Foundation

extension StringProtocol where Index == String.Index {
    public func diff<T: StringProtocol>(with other: T) -> (range: Range<Index>, replacement: T.SubSequence, overlap: Int)? {
        let prefixLength = commonPrefix(with: other).count
        guard prefixLength != count else { return nil }

        let suffixLength = commonSuffix(with: other).count

        let overlap = Swift.max(0, prefixLength + suffixLength - Swift.min(count, other.count))

        return (
            range: index(startIndex, offsetBy: prefixLength - overlap) ..< index(endIndex, offsetBy: -suffixLength + overlap),
            replacement: other[other.index(other.startIndex, offsetBy: prefixLength - overlap) ..< other.index(other.endIndex, offsetBy: -suffixLength + overlap)],
            overlap: overlap
        )
    }
}
