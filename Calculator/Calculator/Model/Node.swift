//
//  Node.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/02.
//

class Node<T: Equatable>: Equatable {
	static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
		return lhs.value == rhs.value
	}
	
	var value: T
	var next: Node?
	
	init(value: T) {
		self.value = value
	}
}
