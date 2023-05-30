//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

class CalculatorItemQueue {
    private(set) var head: CalculatorItemNode?
    private(set) var tail: CalculatorItemNode?
    
    func enqueue(_ newNode: CalculatorItemNode) {
        guard head != nil, let lastNode = tail else {
            head = newNode
            tail = newNode
            return
        }
        newNode.changePrevious(lastNode)
        lastNode.changeNext(newNode)
        tail = newNode
    }
    
    func removeLast() throws {
        guard tail != nil else {
            throw CalculatorError.itemNotFound
        }
        tail = tail?.previous
        tail?.changeNext(nil)
    }
    
    func dequeue() throws -> CalculatorItemNode {
        guard head != nil, let pop = head else {
            throw CalculatorError.itemNotFound
        }
        head = pop.next
        head?.changePrevious(nil)
        pop.changeNext(nil)
        return pop
    }
}
