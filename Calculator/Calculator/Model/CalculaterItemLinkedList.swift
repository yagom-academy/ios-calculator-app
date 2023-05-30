//
//  LinkedList.swift
//  Calculator
//
//  Created by Erick on 2023/05/30.
//

struct CalculaterItemLinkedList {
    var head: CalculateItemNode?
    var tail: CalculateItemNode?
    var count = 0
    
    mutating func apend(_ calculateItemNode: CalculateItemNode) {
        if head == nil {
            head = calculateItemNode
            tail = calculateItemNode
        } else {
            tail?.next = calculateItemNode
            tail = calculateItemNode
        }
        
        count += 1
    }
    
    mutating func removeFirst() -> CalculateItemNode? {
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
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
