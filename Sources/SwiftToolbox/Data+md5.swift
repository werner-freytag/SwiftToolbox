//
//  Copyright © Werner Freytag. All rights reserved.
//

import CommonCrypto
import Foundation

#if os(watchOS)
#else
    extension Data {
        private var md5Data: Data {
            var data = Data(count: Int(CC_MD5_DIGEST_LENGTH))

            data.withUnsafeMutableBytes { digestBytes in
                withUnsafeBytes { buffer in
                    _ = CC_MD5(buffer.baseAddress!, CC_LONG(buffer.count), digestBytes.bindMemory(to: UInt8.self).baseAddress)
                }
            }

            return data
        }

        /// calculate the MD5 hash of the data
        public var md5Hash: String {
            return md5Data.map { String(format: "%02hhx", $0) }.joined()
        }
    }
#endif
