//
//  Node.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/02.
//

class Node<T: Any> {
	var value: T
	var next: Node?
	
	init(value: T) {
		self.value = value
	}
}
