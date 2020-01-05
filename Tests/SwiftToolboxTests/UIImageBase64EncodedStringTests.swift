//
//  Copyright © 2020 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

#if os(iOS) || os(tvOS)

    class UIImageBase64EncodedStringTests: XCTestCase {
        func testEncodeAndDecode() {
            let image = UIImage(size: CGSize(width: 10, height: 10), color: .red)!

            let encoded = image.base64EncodedString
            XCTAssertNotNil(encoded)
            
            let newImage = UIImage(base64EncodedString: encoded!)
            XCTAssertNotNil(newImage)
        }

        static var allTests = [
            ("testEncodeAndDecode", testEncodeAndDecode),
        ]
    }

#endif
