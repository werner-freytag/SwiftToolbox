//
//  Copyright © 2019 Werner Freytag. All rights reserved.
//

import Foundation

infix operator ~
public extension StringProtocol where Index == String.Index {
    /// check if strings are same using localized, case insensitive compare
    static func ~ (left: Self, right: Self) -> Bool {
        return left.localizedCaseInsensitiveCompare(right) == .orderedSame
    }
}

infix operator ~<
public extension StringProtocol where Index == String.Index {
    /// compare strings same using localized, case insensitive compare
    static func ~< (left: Self, right: Self) -> Bool {
        return left.localizedCaseInsensitiveCompare(right) == .orderedAscending
    }
}

public extension StringProtocol {
    /// Returns a value indicating the similarity of both string. If not all characters of the search match,
    /// the result is 0. If strings are same, 1 is returned
    func match(against search: String, options mask: String.CompareOptions = [.caseInsensitive, .diacriticInsensitive, .widthInsensitive]) -> Float {
        guard !isEmpty else { return search.isEmpty ? 1 : 0 }
        guard count >= search.count else { return 0 }

        var similarities: Float = 0

        var offset = startIndex
        for (index, letter) in search.enumerated() {
            guard let range = self[offset...].range(of: String(letter), options: mask) else { return 0 }
            similarities += 1 / Float(1 + distance(from: startIndex, to: range.lowerBound) - index)
            offset = range.upperBound
        }

        return similarities / Float(count)
    }
}
