//
//  Copyright © Werner Freytag. All rights reserved.
//

import Foundation

public extension NSTextCheckingResult {
    /// converts the NSTextCheckingResult to a string range
    func range<T: StringProtocol>(in string: T) -> Range<T.Index> {
        string.index(string.startIndex, offsetBy: range.lowerBound)
            ..<
            string.index(string.startIndex, offsetBy: range.upperBound)
    }
}
