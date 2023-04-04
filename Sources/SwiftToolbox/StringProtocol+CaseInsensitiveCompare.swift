//
//  Copyright © Werner Freytag. All rights reserved.
//

import Foundation

infix operator ~
infix operator ~<

public extension StringProtocol where Index == String.Index {
    /// check if strings are same using localized, case insensitive compare
    static func ~ (left: Self, right: Self) -> Bool {
        left.localizedCaseInsensitiveCompare(right) == .orderedSame
    }

    /// compare strings same using localized, case insensitive compare
    static func ~< (left: Self, right: Self) -> Bool {
        left.localizedCaseInsensitiveCompare(right) == .orderedAscending
    }
}

public extension Optional where Wrapped: StringProtocol {
    /// check if optional strings are same using localized, case insensitive compare
    static func ~ (left: Self, right: Self) -> Bool {
        guard let left = left, let right = right else { return left == right }
        return left ~ right
    }

    /// compare optional strings same using localized, case insensitive compare
    static func ~< (left: Self, right: Self) -> Bool {
        guard let left = left, let right = right else { return false }
        return left ~< right
    }
}

public extension StringProtocol {
    /// Returns a value indicating the similarity of both string. If not all characters of the search match,
    /// the result is 0. If strings are same, 1 is returned
    func match(against search: String, options mask: String.CompareOptions = [.caseInsensitive, .diacriticInsensitive, .widthInsensitive]) -> Double {
        guard !isEmpty else { return search.isEmpty ? 1 : 0 }
        guard !search.isEmpty else { return 0 }
        guard count >= search.count else { return 0 }

        var similarities: Double = 0

        var offset = startIndex
        for (index, letter) in search.enumerated() {
            guard let range = self[offset...].range(of: String(letter), options: mask) else { return 0 }
            
            let distance = Double(1 + distance(from: startIndex, to: range.lowerBound) - index)
            similarities += 1 / (distance * distance)
            offset = range.upperBound
        }
        
        return similarities / Double(count)
    }
}
