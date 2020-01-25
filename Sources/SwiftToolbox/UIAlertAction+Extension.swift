//
//  Copyright © 2020 Werner Freytag. All rights reserved.
//

#if os(iOS) || os(tvOS)

    import UIKit

    extension UIAlertAction {
        private typealias AlertHandler = @convention(block) (UIAlertAction) -> Void

        public var handler: (() -> Void)? {
            guard let block = value(forKey: "handler") else { return nil }
            let handler = unsafeBitCast(block as AnyObject, to: AlertHandler.self)
            return { handler(self) }
        }
    }

#endif
