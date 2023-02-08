//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by kaki on 2023/01/25.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var size: Int {
        var count = 0
        var current = head
        while (current != nil) {
            current = current?.next
            count += 1
        }
        return count
    }
    
    mutating func enqueue(_ data: Element) {
        if head == nil {
            head = Node.init(data)
            tail = head
            return
        }
        
        let newNode = Node.init(data)
        tail?.next = newNode
        tail = newNode
    }
    
    mutating func dequeue() -> Element? {
        if head == nil || tail == nil { return nil }
        
        let dequeue = head
        head = head?.next
        dequeue?.next = nil
        
        return dequeue?.data
    }
    
    mutating func clear() {
            head = nil
            tail = nil
        }
}
