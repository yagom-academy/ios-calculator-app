//
//  CalculatorItemLinkedList.swift
//  Calculator
//
//  Created by Erick on 2023/05/30.
//

struct CalculatorItemLinkedList {
    private(set) var head: CalculatorItemNode?
    private var tail: CalculatorItemNode?
    private(set) var count = 0
    
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
        
        let removedNode = head
        head = head?.next
        count -= 1
        
        if head == nil {
            clear()
        }
        
        return removedNode
    }
    
    mutating func clear() {
        head = nil
        tail = nil
        count = 0
    }
}
