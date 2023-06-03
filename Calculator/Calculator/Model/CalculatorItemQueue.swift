//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

struct CalculatorItemQueue<Element: CalculateItem>: QueueType {
    private var head: CalculatorItemNode<Element>? = nil
    private var tail: CalculatorItemNode<Element>? = nil
    private(set) var count: Int = 0
    
    mutating func enqueue(_ value: Element) {
        let newNode = CalculatorItemNode<Element>(value)
        count += 1
        guard let lastNode = tail else {
            head = newNode
            tail = newNode
            return
        }
        lastNode.changeNext(newNode)
        tail = newNode
    }
    
    mutating func dequeue() throws -> Element {
        guard let firstNode = head else {
            throw CalculatorError.indexOutOfRange
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
