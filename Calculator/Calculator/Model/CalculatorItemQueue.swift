//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by uemu on 2023/10/09.
//

struct CalculatorItemQueue<T: CalculateItem> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        if head == nil {
            return true
        } else {
            return false
        }
    }
    
    var count: Int {
        var current = head
        var elementCount = 0
        
        while current != nil {
            elementCount += 1
            current = current?.next
        }
        
        return elementCount
    }
    
    var peek: T? {
        return head?.value
    }
}
