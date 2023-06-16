//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minsup on 2023/05/30.
//

struct CalculatorItemQueue<T: CalculateItem>: Queueable {
	private var head: Node<T>? = nil
	private var tail: Node<T>? = nil
	private(set) var count: Int = 0
	
	mutating func enqueue(_ value: T) {
		let newNode = Node<T>(value)
		count += 1
		guard let lastNode = tail else {
			head = newNode
			tail = newNode
			return
		}
		lastNode.changeNext(newNode)
		tail = newNode
	}
	
	mutating func dequeue() throws -> T {
		guard let firstNode = head else {
			throw CalculationError.indexOutOfRange
		}
		count -= 1
		head = firstNode.next
		firstNode.changeNext(nil)
		return firstNode.value
	}
	
	mutating func removeAll() {
		for _ in (0...count) {
			guard let firstNode = head else {
				tail = nil
				return
			}
			head = firstNode.next
			firstNode.changeNext(nil)
			count -= 1
		}
	}
}
