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
        tail?.next = Node(value: value)
        tail = tail?.next
    }
}
