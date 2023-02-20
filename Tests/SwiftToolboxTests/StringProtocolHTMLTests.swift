//
//  Copyright © Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

class StringProtocolHTMLTests: XCTestCase {
    func testEscapingHTMLSpecialChars() {
        XCTAssertEqual("<a href=\"/bla?test&test\" class='test'>".escapingHTMLSpecialChars(), "&lt;a href=&quot;/bla?test&amp;test&quot; class=&#039;test&#039;&gt;")
    }

    static var allTests = [
        ("testEscapingHTMLSpecialChars", testEscapingHTMLSpecialChars),
    ]
}
