//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/05/30.
//

extension Int: CalculateItem { }

protocol CalculateItem { }

struct CalculatorItemQueue<Element: CalculateItem> where Element: Equatable {
	private var elements: [Element] = []
	
	func getElementsForTest() -> [Element] {
		return elements
	}
	
	mutating func enqueue(_ value: Element) {
		elements.append(value)
	}
	
	mutating func dequeue() -> Element? {
		if elements != [] {
			return elements.removeFirst()
		} else {
			return nil
		}
	}
	
	func peek() -> Element? {
		return elements.first
	}
	
	mutating func clear() {
		elements.removeAll()
	}
}
