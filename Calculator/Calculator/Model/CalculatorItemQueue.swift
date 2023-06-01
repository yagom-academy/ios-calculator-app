//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/05/30.
//

extension Int: CalculateItem { }
extension Double: CalculateItem { }
extension String: CalculateItem { }

protocol CalculateItem { }

struct CalculatorItemQueue<Element: CalculateItem> {
	private var elements: [Element] = []
	
	mutating func enqueue(_ value: Element) {
		elements.append(value)
	}
	
	mutating func dequeue() -> Element? {
		return elements.removeFirst()
	}
	
	func peek() -> Element? {
		return elements.first
	}
	
	mutating func clear() {
		elements.removeAll()
	}
}
