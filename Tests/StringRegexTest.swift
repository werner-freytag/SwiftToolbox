//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Nimble
import SwiftToolbox
import XCTest

class StringRegexTest : XCTestCase {
    func testRegexQuoted() {
        expect("[]()\\*+?{}.|^$".regexQuoted()) == "\\[\\]\\(\\)\\\\\\*\\+\\?\\{\\}\\.\\|\\^\\$"
        expect("a[b]c(d)e{f}".regexQuoted()) == "a\\[b\\]c\\(d\\)e\\{f\\}"
    }
}
