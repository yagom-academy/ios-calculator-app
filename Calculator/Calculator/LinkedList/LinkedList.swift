//
//  LinkedList.swift
//  Calculator
//
//  Created by Baek on 2022/05/19.
//

import Foundation

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var peek: Node<T>? {
        return head
    }
    
    mutating func append(data: T?) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        let node = head
        tail?.next = node
        tail = node
    }
    
    mutating func removeFirst() -> T? {
        let removeElement = head?.data
        head = head?.next
        return removeElement
    }
    
    mutating func removeAll() {
        head = nil
    }
}
