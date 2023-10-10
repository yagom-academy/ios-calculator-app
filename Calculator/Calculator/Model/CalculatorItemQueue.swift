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
        elementCount += 1
        
        guard isEmpty == false else {
            head = node
            tail = node
            return
        }
        
        tail?.next = node
        tail = tail?.next
    }
    
    mutating func dequeue() -> Item? {
        let newValue: Item?
        
        guard isEmpty == false else {
            return nil
        }
        
        elementCount -= 1
        
        guard head !== tail else {
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
