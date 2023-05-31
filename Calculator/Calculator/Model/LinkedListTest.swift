//
//  LinkedListTest.swift
//  Calculator
//
//  Created by Dasan on 2023/05/31.
//

import Foundation

struct LinkedListTest<T: CalculateItem> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var count: Int = 0
    var isEmpty: Bool { head == nil }
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
    }
        
    mutating func append(_ data: T) {
        let node = Node(data: data)
        
        if isEmpty {
            head = node
            tail = head
        } else {
            tail?.next = node
            tail = node
        }
        count += 1
    }
    
    mutating func removeFirst() -> T? {
        let node = head
        var removedData: T?
        
        if isEmpty {
            removedData = nil
        } else if node?.next == nil {
            head = nil
            tail = nil
            removedData = node?.data
            count -= 1
        } else {
            head = node?.next
            removedData = node?.data
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

