//
//  CalculatorItemLinkedList.swift
//  Calculator
//
//  Created by MARY on 2023/05/31.
//

struct CalculatorItemLinkedList {
    private var front: CalculatorItemNode?
    private var tail: CalculatorItemNode?
    private(set) var size: Int = 0
    
    mutating func append(_ element: CalculateItem) {
        let newItem = CalculatorItemNode(item: element)
        
        if front == nil {
            front = newItem
            tail = front
        } else {
            tail?.next = newItem
            tail = newItem
        }
        size += 1
    }
    
    mutating func removeFirst() -> CalculateItem? {
        guard let result = front?.item else { return nil }
        
        front = front?.next
        size -= 1
        
        if size == 0 {
            front = nil
            tail = nil
        }
        
        return result
    }
    
    mutating func removeAll() {
        front = nil
        tail = nil
        size = 0
    }
}
