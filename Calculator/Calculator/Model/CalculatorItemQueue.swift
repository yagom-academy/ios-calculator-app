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
    
    mutating func enqueue(value: T) {
        let node = Node(value: value)
        
        guard isEmpty == false else {
            head = node
            tail = node
            return
        }
        
        tail?.next = node
        tail = tail?.next
    }
    
    mutating func dequeue() -> T? {
        var newValue: T? = nil
        
        guard isEmpty == false else {
            return nil
        }
        
        if head === tail {
            newValue = head?.value
            head = nil
            tail = nil
            return newValue
        }
        
        newValue = head?.value
        head = head?.next
        return newValue
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
