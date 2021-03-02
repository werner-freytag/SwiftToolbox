//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import Foundation

public extension String {
    /// Shortcut for NSLocalizedString
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
