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
        return range(of: find, options: options) != nil
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

extension String {
    /// Returns all subpatterns of the first match
    public func match(regex: String) throws -> [String]? {
        let regex = try NSRegularExpression(pattern: regex)
        let nsString = self as NSString

        guard let match = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length)).first
        else { return nil }

        var components: [String] = []
        for i in 0 ..< match.numberOfRanges {
            let range = match.range(at: i)
            if range.location == NSNotFound {
                components.append("")
            } else {
                components.append(nsString.substring(with: range) as String)
            }
        }

        return components
    }
}
