//  Queue.swift
//  Created by 레옹아범 on 2023/01/24.

struct Queue {
    var head: Node?
    var tail: Node?
    
    var isEmpty: Bool {
        return self.head == nil
    }
    
    mutating func enqueue(_ node: Node) {
        if isEmpty {
            self.head = node
            self.tail = node
            
            return
        }
        
        node.prev = self.tail
        self.tail?.next = node
        self.tail = node
        self.tail?.next = self.head
    }
    
    mutating func dequeue() -> Node? {
        if isEmpty {
            return nil
        }
        
        let dequeueNode = self.head
        
        self.head = self.head?.next
        self.head?.prev = self.tail
        
        self.tail?.next = self.head
        
        dequeueNode?.prev = nil
        dequeueNode?.next = nil
        
        return dequeueNode
    }
    
    mutating func removeAll() {
        self.head = nil
        self.tail = nil
    }
}
