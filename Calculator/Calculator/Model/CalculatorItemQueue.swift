//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by uemu on 2023/10/09.
//

struct CalculatorItemQueue<Item: CalculateItem> {
    private var head: Node<Item>?
    private var tail: Node<Item>?
    private var elementCount = 0
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        return elementCount
    }
    
    var peek: Item? {
        return head?.value
    }
    
    mutating func enqueue(value: Item) {
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
    
    mutating func dequeue() -> Item? {
        var newValue: Item? = nil
        
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
