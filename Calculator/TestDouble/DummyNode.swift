//
//  DummyNode.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/03.
//

class DummyNode<T: Equatable>: Equatable {
	static func == (lhs: DummyNode<T>, rhs: DummyNode<T>) -> Bool {
		return lhs.value == rhs.value
	}

	var value: T
	var next: DummyNode<T>?
	
	init(value: T) {
		self.value = value
	}
}
