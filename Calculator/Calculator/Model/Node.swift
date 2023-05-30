//
//  Node.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/05/30.
//

struct Node<T>: Equatable {
	static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
		return true
	}
	
	var value: T?
}
