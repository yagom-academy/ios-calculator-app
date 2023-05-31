//
//  LinkedList.swift
//  Calculator
//
//  Created by Yena on 2023/05/30.
//

import Foundation

class Node<T: CalculateItem> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList<T: CalculateItem> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
    var count: Int = 0
    var isEmpty: Bool { (head == nil) }
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
    }
        
    func append(_ data: T) {
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
    
    func removeFirst() -> T? {
        let node = head
        var returnValue: T?
        
        if isEmpty {
            returnValue = nil
        } else if node?.next == nil {
            head = nil
            tail = nil
            returnValue = node?.data
            count -= 1
        } else {
            head = node?.next
            returnValue = node?.data
            count -= 1
        }
    
        return returnValue
    }
    
    func printAllList() {
        var node = head
        while node != nil {
            print("\(String(describing: node?.data)) -> ", terminator: "")
            node = node?.next
        }
    }
    
}
