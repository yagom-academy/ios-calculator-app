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
        newNode.previous = lastNode
        lastNode.next = newNode
        tail = newNode
    }
    
    func removeLastQueue() {
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

class CalculatorItemNode {
    var value: CalculateItem
    var next: CalculatorItemNode?
    var previous: CalculatorItemNode?
    
    init(_ value: CalculateItem) {
        self.value = value
    }
    
    func addNext(_ next: CalculatorItemNode) throws {
        guard self.next == nil else {
            throw CalculatorError.itemAlreadyExist
        }
        self.next = next
    }
    
    func addPrevious(_ previous: CalculatorItemNode) throws {
        guard self.previous == nil else {
            throw CalculatorError.itemAlreadyExist
        }
        self.previous = previous
    }
    func removeNext() {}
}
