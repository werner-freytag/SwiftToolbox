//
//  Copyright © 2019, 2020 Werner Freytag. All rights reserved.
//

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Collection where Element: Equatable, Index == Int {
    private func adaptLength<T: Collection>(with other: T) -> SubSequence {
        return prefix(Swift.min(count, other.count))
    }

    /// Find common prefix with another array
    public func commonPrefix<T: Collection>(with other: T) -> SubSequence where T.Element == Self.Element, T.Index == Int {
        let array = adaptLength(with: other)
        let prefixCnt = array.enumerated().first { $0.1 != other[$0.0] }?.offset ?? array.endIndex

        return self[..<prefixCnt]
    }

    /// Find common suffix with another array
    public func commonSuffix<T: Collection>(with other: T) -> SubSequence where T.Element == Self.Element, T.Index == Int {
        let array = reversed().adaptLength(with: other)
        let cnt = other.count
        let prefixCnt = array.enumerated().first { $0.1 != other[cnt - $0.0 - 1] }?.offset ?? array.count

        return self[(count - prefixCnt)...]
    }
}
