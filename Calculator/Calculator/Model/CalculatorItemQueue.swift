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
    
    mutating func enqueue(_ newNode: CalculatorItemNode) {
        count += 1
        guard let lastNode = tail else {
            head = newNode
            tail = newNode
            return
        }
        newNode.changePrevious(lastNode)
        lastNode.changeNext(newNode)
        tail = newNode
    }
    
    mutating func dequeue() throws -> CalculatorItemNode {
        guard let firstNode = head else {
            throw CalculatorError.indexOutOfRange
        }
        count -= 1
        head = firstNode.next
        head?.changePrevious(nil)
        firstNode.changeNext(nil)
        return firstNode
    }
    
    mutating func removeLast() {
        guard let lastNode = tail else { return }
        count -= 1
        tail = lastNode.previous
        tail?.changeNext(nil)
        lastNode.changePrevious(nil)
    }
    
    mutating func removeAll() {
        guard tail != nil else { return }
        for _ in (0...count) {
            self.removeLast()
        }
        head = nil
        tail = nil
    }
}
