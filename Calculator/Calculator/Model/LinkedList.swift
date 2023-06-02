//
//  LinkedList.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/02.
//

protocol LinkedListProtocol {
	associatedtype T: Any
	var isEmpty: Bool { get }
	func enqueue(value: T)
	func dequeue()
}

class LinkedList<T>: LinkedListProtocol {
	private var head: Node<T>?
	private var tail: Node<T>?
	
	var isEmpty: Bool {
		return head == nil
	}
	
	func enqueue(value: T) {
		let newNode = Node(value: value)
		if let tailNode = tail {
			tailNode.next = newNode
		} else {
			head = newNode
		}
		tail = newNode
	}
	
	func dequeue() {
		if let nextNode = head?.next {
			head = nextNode
		} else {
			head = nil
			tail = nil
		}
	}
}
