//
//  LinkedListTest.swift
//  Calculator
//
//  Created by Dasan on 2023/05/31.
//

import Foundation

struct LinkedListTest<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var count: Int = 0
    var isEmpty: Bool { head == nil }
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
    }
        
    mutating func append(_ data: T) {
        if isEmpty {
            head = Node(data: data)
            tail = head
        } else {
            let node = Node(data: data)
            tail?.next = node
            tail = node
        }
        
        count += 1
    }
    
    mutating func removeFirst() -> T? {
        var removedData: T?
        
        if isEmpty {
            removedData = nil
        } else if head?.next == nil {
            removedData = head?.data
            head = nil
            tail = nil
            count -= 1
        } else {
            removedData = head?.data
            head = head?.next
            count -= 1
        }
    
        return removedData
    }
    
    mutating func printAllList() {
        var node = head
        while node != nil {
            print("\(String(describing: node?.data))", terminator: " -> ")
            node = node?.next
        }
    }
}

