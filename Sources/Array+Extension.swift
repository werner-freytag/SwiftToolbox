//
//  Copyright © 2016 - 2018 Werner Freytag. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
	@discardableResult mutating func remove(_ object: Element) -> Element? {
		guard let index = index(of: object) else { return nil }
		return self.remove(at: index)
	}
}

public extension Array where Element : NSObject {
	func filter(_ predicate:NSPredicate) -> [Iterator.Element] {
		return (self as NSArray).filtered(using: predicate) as! [Iterator.Element]
	}
}

public extension Array where Element : Hashable {
	var uniqueElements:[Element] {
		var single = Set<Element>()
		return filter { single.insert($0).inserted }
	}
}

public extension Array where Element : Equatable {
	mutating func removeDuplicateElements() {
		self = uniqueElements
	}
	
	func intersection(_ array: [Element]) -> [Element] {
		return filter { array.contains($0) }
	}
	
	var uniqueElements:[Element] {
		var resultArray:[Element] = []
		for element in self where !resultArray.contains(element) {
			resultArray.append(element)
		}
		
		return resultArray
	}
}

public func -<T:Equatable>(lhs:Array<T>, rhs:Array<T>) -> Array<T> {
	return lhs.filter { !rhs.contains($0) }
}

public func -=<T:Equatable>(lhs:inout Array<T>, rhs:Array<T>) {
	for element in rhs {
		lhs.remove(element)
	}
}

