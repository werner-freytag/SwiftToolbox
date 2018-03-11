//
//  Copyright © 2016 - 2018 Werner Freytag. All rights reserved.
//

import Foundation

extension String {
    public var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String {
    public func base64Encoded() -> Data? {
        return Data(base64Encoded: self)
    }
}

extension String {
    public func contains(_ find: String, options: String.CompareOptions = [.caseInsensitive, .widthInsensitive]) -> Bool {
        return self.range(of: find, options: options) != nil
    }
}

extension String {
    public func naturalCompare(_ other: String) -> Bool {
        return localizedCaseInsensitiveCompare(other) == .orderedSame
    }
}

extension Array where Element == String {
    public func naturalSorted() -> [String] {
        return sorted {
            $0.localizedCaseInsensitiveCompare($1) == .orderedAscending
        }
    }
}
