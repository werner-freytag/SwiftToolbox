//
//  Copyright © 2016-2019 Werner Freytag. All rights reserved.
//

import Foundation

extension StringProtocol where Index == String.Index {
    public func escapingHTMLSpecialChars() -> String {
        return replacingOccurrences(of: "&", with: "&amp;")
            .replacingOccurrences(of: "\"", with: "&quot;")
            .replacingOccurrences(of: "<", with: "&lt;")
            .replacingOccurrences(of: ">", with: "&gt;")
            .replacingOccurrences(of: "'", with: "&#039;")
    }
}
