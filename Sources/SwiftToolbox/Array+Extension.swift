//
//  Copyright © 2016 - 2018 Werner Freytag. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    @discardableResult mutating func remove(_ object: Element) -> Element? {
        guard let index = firstIndex(of: object) else { return nil }
        return remove(at: index)
    }
}

public extension Array where Element: NSObject {
    /// Filter an array by an NSPredicate
    func filter(_ predicate: NSPredicate) -> [Iterator.Element] {
        return (self as NSArray).filtered(using: predicate) as! [Iterator.Element]
    }
}

public extension Array where Element: Hashable {
    /// returns only unque elements of an array of hashable elements
    @available(*, deprecated, message: "Use https://github.com/apple/swift-algorithms/blob/main/Guides/Unique.md instead")
    func uniqueElements() -> [Element] {
        var single = Set<Element>()
        return filter { single.insert($0).inserted }
    }
}

public extension Array where Element: Equatable {
    /// Remove duplicate elements of an array
    mutating func removeDuplicateElements() {
        self = uniqueElements()
    }

    /// Intersect array with another array
    func intersection(_ array: [Element]) -> [Element] {
        return filter { array.contains($0) }
    }

    /// returns only unque elements of an array
    func uniqueElements() -> [Element] {
        var resultArray: [Element] = []
        for element in self where !resultArray.contains(element) {
            resultArray.append(element)
        }

        return resultArray
    }
}

/// Use "-" to substract arrays by element
public func - <T: Equatable>(lhs: [T], rhs: [T]) -> [T] {
    return lhs.filter { !rhs.contains($0) }
}

/// Use "-=" to remove elements from an array
public func -= <T: Equatable>(lhs: inout [T], rhs: [T]) {
    lhs = lhs - rhs
}
