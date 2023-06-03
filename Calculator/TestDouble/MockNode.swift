//
//  MockNode.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/03.
//

class MockNode<T: Equatable>: Equatable {
	static func == (lhs: MockNode<T>, rhs: MockNode<T>) -> Bool {
		return lhs.value == rhs.value
	}

	var value: T
	var next: MockNode<T>?
	
	init(value: T) {
		self.value = value
	}
}
