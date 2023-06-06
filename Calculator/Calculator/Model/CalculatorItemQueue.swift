//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/05/30.
//

extension Double: CalculateItem { }

protocol CalculateItem: Equatable { }

struct CalculatorItemQueue<T: CalculateItem> {
	private var list: LinkedList<T>?
	
	var isEmpty: Bool? {
		guard let isQueueEmpty = list?.isEmpty else { return nil }
		return isQueueEmpty
	}
	
	var front: T? {
		return list?.head?.value
	}
	
	func enqueue(_ value: T) {
		list?.append(value: value)
	}
	
	func dequeue() -> T? {
		return list?.removeFirst()
	}
	
	init(list: LinkedList<T>) {
		self.list = list
	}
}
