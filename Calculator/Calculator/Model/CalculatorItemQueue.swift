//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minsup on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculateItem> {
	private var head: Node<Element>? = nil
	private var tail: Node<Element>? = nil
	private(set) var count: Int = 0
    
    init(_ elements: [Element] = []) {
        for element in elements {
            self.enqueue(element)
        }
    }
    
    var isEmpty: Bool {
        count == 0
    }
	
	mutating func enqueue(_ value: Element) {
		let newNode = Node<Element>(value)
		count += 1
		guard let lastNode = tail else {
			head = newNode
			tail = newNode
			return
		}
		lastNode.changeNext(newNode)
		tail = newNode
	}
	
	mutating func dequeue()  -> Element? {
		guard let firstNode = head else {
			return nil
		}
		count -= 1
		head = firstNode.next
		firstNode.changeNext(nil)
		return firstNode.value
	}
	
	mutating func clear() {
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
    
    mutating func getAllElement() -> [Element] {
        var allElement: [Element] = []
        
        for _ in (0...count) {
            guard let firstNode = head else {
                tail = nil
                return allElement
            }
            allElement.append(firstNode.value)
            head = firstNode.next
            firstNode.changeNext(nil)
            count -= 1
        }
        return allElement
    }
}
