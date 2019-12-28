//
//  Copyright © 2017-2019 Werner Freytag. All rights reserved.
//

import Foundation

extension Thread {
    /// run a block on main thread, but only use dispatch queue if necessary
    public static func runOnMain(block: () -> Void) {
        if Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.sync {
                block()
            }
        }
    }
}
