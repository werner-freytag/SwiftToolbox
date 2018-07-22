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
	public func filter(_ predicate: NSPredicate) -> [Iterator.Element] {
		return (self as NSArray).filtered(using: predicate) as! [Iterator.Element]
	}
}

public extension Array where Element : Hashable {
	public func uniqueElements() -> [Element] {
		var single = Set<Element>()
		return filter { single.insert($0).inserted }
	}
}

public extension Array where Element : Equatable {
	public mutating func removeDuplicateElements() {
        self = uniqueElements()
	}
	
	public func intersection(_ array: [Element]) -> [Element] {
		return filter { array.contains($0) }
	}
	
	public func uniqueElements() -> [Element] {
		var resultArray: [Element] = []
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

extension Array where Element : Equatable {
    private func adaptLength<T: RandomAccessCollection>(with other: T) -> ArraySlice<Element> {
        return prefix(Swift.min(count, other.count))
    }

    public func commonPrefix<T: RandomAccessCollection>(with other: T) -> T.SubSequence
        where T.Element == Element, T.Index == Index {
            
        let array = adaptLength(with: other)
        let prefixCnt = array.enumerated().first { $0.1 != other[$0.0] }?.offset ?? array.endIndex

        return other[..<prefixCnt]
    }
    
    public func commonSuffix<T: RandomAccessCollection>(with other: T) -> T.SubSequence
        where T.Element == Element, T.Index == Index {
            
            let array = reversed().adaptLength(with: other)
            let cnt = other.count
            let prefixCnt = array.enumerated().first { $0.1 != other[cnt - $0.0 - 1] }?.offset ?? array.endIndex
            
            return other[(cnt - prefixCnt)...]
    }
}

extension Array where Element: Equatable {
    
    /// Returns the smallest slice of elements that can be repeated to form the array
    public var leastCommonSlice: ArraySlice<Element>? {
        let count = self.count
        var partition: ArraySlice<Element>?
        
        guard (1...count/2).first(where: { partitionSize in
            guard count % partitionSize == 0 else { return false }
            
            partition = self[0..<partitionSize]
            let numberOfPartitions = count / partitionSize
            
            return (1..<numberOfPartitions).first(where: { iteration in
                let offset = partitionSize * iteration
                return partition != self[offset..<offset + partitionSize]
            }) == nil
            
        }) != nil else {
            return nil
        }
        
        return partition
    }
}
