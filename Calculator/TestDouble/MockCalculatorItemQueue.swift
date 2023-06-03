//
//  MockCalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/03.
//

extension Int: CalculateItemProtocol { }

protocol MockLinkedListProtocol {
	associatedtype T: Any
	var isEmpty: Bool { get }
	func append(value: T)
	func removeFirst() -> T?
}

class DummyLinkedList<T: CalculateItemProtocol>: MockLinkedListProtocol {
	var head: MockNode<T>?
	var tail: MockNode<T>?
	
	internal var isEmpty: Bool {
		return head == nil
	}
	
	internal func append(value: T) {
		let newNode = MockNode(value: value)
		if let tailNode = tail {
			tailNode.next = newNode
		} else {
			head = newNode
		}
		tail = newNode
	}
	
	internal func removeFirst() -> T? {
		guard let firstNode = head else { return nil }
		head = firstNode.next
		if head == nil {
			tail = nil
		}
		return firstNode.value
	}
}

struct MockCalculatorItemQueue<T: CalculateItemProtocol> {
	public var dummyList: DummyLinkedList<T>?
	
	public var isEmpty: Bool? {
		guard let isEmptyDummyList = dummyList?.isEmpty else { return nil }
		return isEmptyDummyList
	}
	
	public var front: T? {
		return dummyList?.head?.value
	}
	
	public func enqueue(_ value: T) {
		dummyList?.append(value: value)
	}
	
	public func dequeue() -> T? {
		return dummyList?.removeFirst()
	}
	
	init(dummyList: DummyLinkedList<T>?) {
		self.dummyList = dummyList
	}
}
