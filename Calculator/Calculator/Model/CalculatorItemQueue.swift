//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by uemu on 2023/10/09.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private var elementCount = 0
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
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
            elementCount += 1
            return
        }
        
        tail?.next = node
        tail = tail?.next
        elementCount += 1
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
        elementCount -= 1
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
