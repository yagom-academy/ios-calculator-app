//
//  Node.swift
//  Calculator
//
//  Created by 써니쿠키 on 2022/09/19.
//

struct LinkedList <T: CalculateItem> {
    private(set) var head: Node<T>?
    var last: Node<T>? {
        var currentNode = self.head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        return currentNode
    }
    
    mutating func append(_ data: T) {
        guard self.head != nil else {
            self.head = Node(data: data)
            return
        }
        
        var currentNode = self.head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        currentNode?.next = Node(data: data)
    }
    
    mutating func removeLast() -> Node<T>? {
        var  lastNode = self.head
        
        guard self.head != nil else {
            return nil
        }
        
        guard self.head?.next != nil else {
            self.head = nil
            return lastNode
        }
        
        var currentNode = self.head
        
        while currentNode?.next?.next != nil {
            currentNode = currentNode?.next
        }
        
        lastNode = currentNode?.next
        currentNode?.next = nil
        
        return lastNode
    }
    
    mutating func removeFirst() -> Node<T>? {
        let firstNode = self.head
        
        guard firstNode != nil else {
            return nil
        }
        
        self.head = firstNode?.next
        return firstNode
    }
    
    mutating func isEmpty() -> Bool {
        self.head == nil ? true : false
    }
}
