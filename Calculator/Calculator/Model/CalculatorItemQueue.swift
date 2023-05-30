//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

struct CalculatorItemQueue {
    private(set) var head: CalculatorItemNode?
    private(set) var tail: CalculatorItemNode?
    private(set) var count: Int = 0
    
    mutating func enqueue(_ value: CalculateItem) {
        let newNode = CalculatorItemNode(value)
        count += 1
        guard let lastNode = tail else {
            head = newNode
            tail = newNode
            return
        }
        lastNode.changeNext(newNode)
        tail = newNode
    }
    
    mutating func dequeue() throws -> CalculateItem {
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
