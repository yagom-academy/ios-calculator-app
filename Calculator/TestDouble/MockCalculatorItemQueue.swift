//
//  MockCalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/03.
//

extension Int: CalculateItemProtocol { }

class DummyLinkedList<T> {
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
