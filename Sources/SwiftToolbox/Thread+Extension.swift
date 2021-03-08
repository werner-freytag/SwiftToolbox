//
//  Copyright © 2017-2019 Werner Freytag. All rights reserved.
//

import Foundation

public extension Thread {
    /// run a block on main thread, but only use dispatch queue if necessary
    @discardableResult static func runOnMain<T>(block: () -> T) -> T {
        guard !Thread.isMainThread else { return block() }

        var result: T!
        DispatchQueue.main.sync { result = block() }
        return result
    }
}
