//
//  MockCalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/03.
//
struct MockCalculatorItemQueue<T: CalculateItem> {
	public var mockList: MockLinkedList<T>?
	
	public var isEmpty: Bool? {
		guard let isEmptyDummyList = mockList?.isEmpty else { return nil }
		return isEmptyDummyList
	}
	
	public var front: T? {
		return mockList?.head?.value
	}
	
	public func enqueue(_ value: T) {
		mockList?.append(value: value)
	}
	
	public func dequeue() -> T? {
		return mockList?.removeFirst()
	}
	
	init(dummyList: MockLinkedList<T>?) {
		self.mockList = dummyList
	}
}
