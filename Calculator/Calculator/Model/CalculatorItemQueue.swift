//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by kaki on 2023/01/25.
//

struct CalculatorItemQueue: CalculateItem {
    private var head: Node?
    private var tail: Node?
    
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
    
    mutating func enqueue(data: CalculateItem) {
        if head == nil || tail == nil {
            head = Node.init(data)
            tail = head
            return
        }
        
        let newNode = Node.init(data)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    mutating func dequeue() -> String? {
        if head == nil || tail == nil { return nil }
        
        let dequeue = self.head
        self.head = self.head?.next
        dequeue?.next = nil
        
        guard let data = dequeue?.data as? String else { return nil }
                
        return data
    }
}
