//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Foundation

public extension Sequence {
    
    /// A Boolean value indicating whether the sequence is empty.
    var isEmpty: Bool {
        var iterator = makeIterator()
        return iterator.next() == nil
    }
}
