//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import Nimble
import SwiftToolbox
import XCTest

class StringProtocolHTMLTests: XCTestCase {
    func testEscapingHTMLSpecialChars() {
        expect("<a href=\"/bla?test&test\" class='test'>".escapingHTMLSpecialChars()) == "&lt;a href=&quot;/bla?test&amp;test&quot; class=&#039;test&#039;&gt;"
    }

    static var allTests = [
        ("testEscapingHTMLSpecialChars", testEscapingHTMLSpecialChars),
    ]
}
