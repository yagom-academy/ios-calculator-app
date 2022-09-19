//
//  LinkedList.swift
//  Calculator
//
//  Created by jin on 9/19/22.
//

import Foundation

public class Node {
    
    public var value: String
    public var next: Node?
    
    public init(value: String, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

public struct LinkedList {
    
    public var head: Node?
    public var tail: Node?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(_ value: String) {
        
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: String) {
        
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    public mutating func pop() -> String? {
        
        let returnValue = head?.value
        head = head?.next
        if isEmpty {
            tail = nil
        }
        
        return returnValue
    }
    
    public mutating func removeLast() -> String? {
        
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
    
    public mutating func removeAll() {
        head = nil
        tail = nil
    }
}
