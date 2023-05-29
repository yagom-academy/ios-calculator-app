//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

class CalculatorItemQueue {
    var head: CalculatorItemNode?
    var tail: CalculatorItemNode?
    
    func append(_ newNode: CalculatorItemNode) {
        guard head != nil, let lastNode = tail else {
            head = newNode
            tail = newNode
            return
        }
        newNode.previous = lastNode
        lastNode.next = newNode
        tail = newNode
    }
    func removeLast() {
        
    }
    func pop() {}
}

class CalculatorItemNode {
    var value: CalculateItem
    var next: CalculatorItemNode?
    var previous: CalculatorItemNode?
    
    init(_ value: CalculateItem) {
        self.value = value
    }
    
    func addNext(_ next: CalculateItem) {}
    func addPrevious(_ previous: CalculateItem) {}
    func removeNext() {}
}
