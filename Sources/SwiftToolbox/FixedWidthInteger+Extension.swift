//
//  Copyright © Werner Freytag. All rights reserved.
//

import Foundation

public extension FixedWidthInteger {
    /// returns the number of digits an Int has
    var numberOfDigits: Int {
        guard self != 0 else { return 1 }
        return Int(log10(abs(Double(self)))) + 1
    }
}
