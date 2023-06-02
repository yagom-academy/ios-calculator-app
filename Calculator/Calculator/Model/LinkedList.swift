//
//  LinkedList.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/02.
//

protocol LinkedListProtocol {
	associatedtype T: Any
	var isEmpty: Bool { get }
	func append(value: T)
	func removeFirst() -> T?
}

class LinkedList<T>: LinkedListProtocol {
	private var head: Node<T>?
	private var tail: Node<T>?
	
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
