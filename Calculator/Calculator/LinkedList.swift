//
//  LinkedList.swift
//  Calculator
//
//  Created by jin on 9/19/22.
//

import Foundation

class Node {
    
    let value: String
    var next: Node?
    
    init(value: String, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList {
    
    var head: Node?
    var tail: Node?
    
    init() {}
    
    var isEmpty: Bool {
        head == nil
    }
    
    mutating func push(_ value: String) {
        
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: String) {
        
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    mutating func pop() -> String? {
        
        let returnValue = head?.value
        head = head?.next
        if isEmpty {
            tail = nil
        }
        
        return returnValue
    }
    
    mutating func removeLast() -> String? {
        
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        
        return current.value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
