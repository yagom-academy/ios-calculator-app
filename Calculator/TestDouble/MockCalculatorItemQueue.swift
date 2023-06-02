//
//  MockCalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/03.
//

extension Int: CalculateItemProtocol { }

class DummyLinkedList<T> {
	var head: Node<T>?
	var tail: Node<T>?
	
	var isEmpty: Bool {
		return head == nil
	}
	
	func append(value: T) {
		let newNode = Node(value: value)
		if let tailNode = tail {
			tailNode.next = newNode
		} else {
			head = newNode
		}
		tail = newNode
	}
	
	func removeFirst() -> T? {
		guard let firstNode = head else { return nil }
		head = firstNode.next
		if head == nil {
			tail = nil
		}
		return firstNode.value
	}
}

struct MockCalculatorItemQueue<T: CalculateItemProtocol> {
	var dummyList: DummyLinkedList<T>?
	
	var isEmpty: Bool? {
		guard let isEmptyDummyList = dummyList?.isEmpty else { return nil }
		return isEmptyDummyList
	}
	
	var front: T? {
		return dummyList?.head?.value
	}
	
	func enqueue(_ value: T) {
		dummyList?.append(value: value)
	}
	
	func dequeue() -> T? {
		return dummyList?.removeFirst()
	}
	
	init(dummyList: DummyLinkedList<T>?) {
		self.dummyList = dummyList
	}
}
