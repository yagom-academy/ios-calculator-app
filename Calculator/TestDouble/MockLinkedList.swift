//
//  MockLinkedList.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/05.
//

class MockLinkedList<T: CalculateItem>: LinkedListProtocol {
	var head: DummyNode<T>?
	var tail: DummyNode<T>?
	
	internal var isEmpty: Bool {
		return head == nil
	}
	
	internal func append(value: T) {
		let newNode = DummyNode(value: value)
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
