//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/05/30.
//


protocol CalculateItem {
	
}

struct CalculatorItemQueue: CalculateItem {
	private var elements: [Int] = []
	
	mutating func enqueue(_ value: Int) -> [Int] {
		elements.append(value)
		return elements
	}
	
	mutating func dequeue() -> Int? {
		return elements.removeFirst()
	}
	
	func peek() -> Int? {
		return elements.first
	}
}
