//
//  MockCalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/03.
//

extension Int: CalculateItemProtocol { }

class DummyLinkedList<T>: Equatable where T: Equatable {
	static func == (lhs: DummyLinkedList<T>, rhs: DummyLinkedList<T>) -> Bool {
		guard let lhsHead = lhs.head as? T else { return false }
		guard let rhsHead = rhs.head as? T else { return false }
		return lhsHead == rhsHead
	}
	
	
	
	
	fileprivate var head: Node<T>?
	fileprivate var tail: Node<T>?
	
	fileprivate var isEmpty: Bool {
		return head == nil
	}
	
	fileprivate func append(value: T) {
		let newNode = Node(value: value)
		if let tailNode = tail {
			tailNode.next = newNode
		} else {
			head = newNode
		}
		tail = newNode
	}
	
	fileprivate func removeFirst() -> T? {
		guard let firstNode = head else { return nil }
		head = firstNode.next
		if head == nil {
			tail = nil
		}
		return firstNode.value
	}
}

struct MockCalculatorItemQueue<T: CalculateItemProtocol>: Equatable where T: Equatable {
	static func == (lhs: MockCalculatorItemQueue, rhs: MockCalculatorItemQueue) -> Bool {
		return lhs.dummyList == rhs.dummyList
	}
	
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
