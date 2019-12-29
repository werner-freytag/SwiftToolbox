//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import SwiftToolbox
import XCTest

#if os(iOS) || os(tvOS)

    class UIImageExtensionTest: XCTestCase {
        func testInitWithSizeColor() {
            let image = UIImage(size: CGSize(width: 10, height: 10), color: .red)
            XCTAssertEqual(image?.size, CGSize(width: 10, height: 10))

            let image2 = UIImage(size: CGSize(width: 10, height: 10))
            XCTAssertEqual(image2?.size, CGSize(width: 10, height: 10))
        }

        func testInitWithContentsOfView() {
            let view = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
            let image = UIImage(contentsOf: view)!
            XCTAssertEqual(image.size, CGSize(width: 10, height: 10))
        }

        func testInitWithContentsOfViewInRect() {
            let view = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
            let image = UIImage(contentsOf: view, in: CGRect(x: 5, y: 5, width: 5, height: 5))!
            XCTAssertEqual(image.size, CGSize(width: 5, height: 5))
        }

        func testColoredWith() {
            let size = CGSize(width: 10, height: 10)
            let image = UIImage(size: size, color: .red)
            XCTAssertEqual(image?.colored(with: .red)?.size, size)
        }

        func testWithAlpha() {
            let size = CGSize(width: 10, height: 10)
            let image = UIImage(size: CGSize(width: 10, height: 10), color: .red)
            XCTAssertEqual(image?.withAlpha(0.5)?.size, size)
        }

        func testResized() {
            let image = UIImage(size: CGSize(width: 10, height: 10), color: .red)
            XCTAssertEqual(image?.resized(to: CGSize(width: 10, height: 20), mode: .scaleAspectFit)?.size, CGSize(width: 10, height: 20))
            XCTAssertEqual(image?.resized(to: CGSize(width: 10, height: 20), mode: .scaleAspectFill)?.size, CGSize(width: 10, height: 20))
            XCTAssertEqual(image?.resized(to: CGSize(width: 10, height: 20), mode: .scaleToFill)?.size, CGSize(width: 10, height: 20))
        }

        func testCropped() {
            let image = UIImage(size: CGSize(width: 10, height: 10), color: .red)
            XCTAssertEqual(image?.cropped(to: CGRect(x: 2, y: 2, width: 5, height: 4))?.size, CGSize(width: 5, height: 4))
        }

        static var allTests = [
            ("testInitWithSizeColor", testInitWithSizeColor),
            ("testInitWithContentsOfView", testInitWithContentsOfView),
            ("testInitWithContentsOfViewInRect", testInitWithContentsOfViewInRect),
            ("testColoredWith", testColoredWith),
            ("testWithAlpha", testWithAlpha),
            ("testResized", testResized),
            ("testCropped", testCropped),
        ]
    }

#endif
