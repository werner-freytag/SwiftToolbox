//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import Foundation

infix operator ~
extension StringProtocol where Index == String.Index {
    static func ~ (left: Self, right: Self) -> Bool {
        return left.localizedCaseInsensitiveCompare(right) == .orderedSame
    }
}

infix operator ~<
extension StringProtocol where Index == String.Index {
    static func ~< (left: Self, right: Self) -> Bool {
        return left.localizedCaseInsensitiveCompare(right) == .orderedAscending
    }
}
