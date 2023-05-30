//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

class CalculatorItemQueue {
    private(set) var head: CalculatorItemNode?
    private(set) var tail: CalculatorItemNode?
    private(set) var count: Int = 0
    
    func enqueue(_ newNode: CalculatorItemNode) {
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
    
    func removeLast() throws {
        guard let oldTail = tail else {
            throw CalculatorError.indexOutOfRange
        }
        count -= 1
        tail = oldTail.previous
        tail?.changeNext(nil)
        oldTail.changePrevious(nil)
    }
    
    func dequeue() throws -> CalculatorItemNode {
        guard let firstNode = head else {
            throw CalculatorError.indexOutOfRange
        }
        count -= 1
        head = firstNode.next
        head?.changePrevious(nil)
        firstNode.changeNext(nil)
        return firstNode
    }
}
