//
//  Node.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/15.
//

class Node<T: CalculateItem> {
	private(set) var value: T
	private(set) var next: Node?
	
	init(_ value: T) {
		self.value = value
	}
	
	func changeNext(_ next: Node?) {
		self.next = next
	}
}
