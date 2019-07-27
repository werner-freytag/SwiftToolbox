//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Nimble
@testable import SwiftToolbox
import XCTest

class StringProtocolCaseInsensitiveCompareTests: XCTestCase {
    func testCompareEquals() {
        expect("Hello" ~ "hello") == true
        expect("hello" ~ "Hello") == true
        expect("hellO" ~ "HellO") == true
        expect("hellö" ~ "HellO") == false
    }

    func testCompareLessThan() {
        expect("Hello" ~< "hello") == false
        expect("hello" ~< "Hello") == false
        expect("hellO" ~< "HellO") == false
        expect("hellO 1" ~< "HellO 2") == true
    }
}
