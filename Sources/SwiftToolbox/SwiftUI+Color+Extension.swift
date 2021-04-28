//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import SwiftUI

@available(macOS 10.15, *)
public extension SwiftUI.Color {
    init(hex: Int) {
        let components = (
            Double((hex >> 16) & 0xFF) / 255,
            Double((hex >> 08) & 0xFF) / 255,
            Double((hex >> 00) & 0xFF) / 255
        )
        self.init(red: components.0, green: components.1, blue: components.2)
    }
}