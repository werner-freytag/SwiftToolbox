//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import Foundation

infix operator ~
extension StringProtocol where Index == String.Index {
    static func ~ (left: Self, right: Self) -> Bool {
        return left.localizedCaseInsensitiveCompare(right) == .orderedSame
    }
}

infix operator ~<
extension StringProtocol where Index == String.Index {
    static func ~< (left: Self, right: Self) -> Bool {
        return left.localizedCaseInsensitiveCompare(right) == .orderedAscending
    }
}

public extension StringProtocol {
    /// Returns a value indicating the similarity of both string. If not all characters of the search match,
    /// the result is 0. If strings are same, 1 is returned
    func match(against search: String, options mask: NSString.CompareOptions = [.caseInsensitive, .diacriticInsensitive, .widthInsensitive]) -> Float {
        guard !isEmpty else { return search.isEmpty ? 1 : 0 }
        guard count >= search.count else { return 0 }

        var similarities: Float = 0

        var offset = startIndex
        for letter in search {
            guard let range = self[offset...].range(of: String(letter), options: mask) else { return 0 }
            similarities += 1 / Float(1 + distance(from: offset, to: range.lowerBound))
            offset = range.upperBound
        }

        return similarities / Float(count)
    }
}
