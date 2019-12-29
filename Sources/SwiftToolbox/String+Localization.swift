//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import Foundation

extension String {
    /// Shortcut for NSLocalizedString
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
