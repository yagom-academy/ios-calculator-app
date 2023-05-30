//
//  LinkedList.swift
//  Calculator
//
//  Created by Erick on 2023/05/30.
//

struct CalculatorItemLinkedList {
    var head: CalculatorItemNode?
    var tail: CalculatorItemNode?
    var count = 0
    
    mutating func append(_ calculatorItemNode: CalculatorItemNode) {
        if head == nil {
            head = calculatorItemNode
            tail = calculatorItemNode
        } else {
            tail?.next = calculatorItemNode
            tail = calculatorItemNode
        }
        
        count += 1
    }
    
    mutating func removeFirst() -> CalculatorItemNode? {
        guard head != nil else {
            clear()
            return nil
        }
        
        let removeNode = head
        head = head?.next
        count -= 1
        
        if head == nil {
            clear()
        }
        
        return removeNode
    }
    
    private mutating func clear() {
        head = nil
        tail = nil
    }
}
