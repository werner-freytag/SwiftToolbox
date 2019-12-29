//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
