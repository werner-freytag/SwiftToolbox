//
//  Copyright © 2020 Werner Freytag. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import UIKit

    extension UIImage {
        public convenience init?(base64EncodedString: String) {
            guard let data = Data(base64Encoded: base64EncodedString) else { return nil }
            self.init(data: data)
        }

        public var base64EncodedString: String? {
            pngData()?.base64EncodedString()
        }
    }
#endif
