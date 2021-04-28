//
//  Copyright © 2020 Werner Freytag. All rights reserved.
//

import Foundation

public extension RandomAccessCollection where Element: Equatable, Index == Int, SubSequence: Equatable {
    /// Returns the smallest slice of elements that can be repeated to form the array
    var leastCommonSlice: SubSequence? {
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
