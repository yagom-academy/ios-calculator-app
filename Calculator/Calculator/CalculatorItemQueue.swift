//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

class CalculatorItemQueue {
    var head: CalculatorItemNode?
    var tail: CalculatorItemNode?
    
    func appendQueue(_ newNode: CalculatorItemNode) {
        guard head != nil, let lastNode = tail else {
            head = newNode
            tail = newNode
            return
        }
        newNode.changePrevious(lastNode)
        lastNode.changeNext(newNode)
        tail = newNode
    }
    
    func removeLastQueue() throws {
        guard tail != nil else {
            throw CalculatorError.itemNotFound
        }
        tail = tail?.previous
        tail?.next = nil
    }
    
    func popQueue() throws -> CalculatorItemNode {
        guard head != nil, let pop = head else {
            throw CalculatorError.itemNotFound
        }
        head = pop.next
        head?.previous = nil
        pop.next = nil
        return pop
    }
}
