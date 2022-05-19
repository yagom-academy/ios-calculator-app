//
//  LinkedList.swift
//  Calculator
//
//  Created by Baek on 2022/05/19.
//

import Foundation

struct LinkedList<T> {
    private var head: Node<T>?
    
    var headIsEmpty: Bool {
        return head == nil
    }
    
    var firstPeek: Node<T>? {
        return head
    }
    
    mutating func append(data: T?) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = Node(data: data)
    }
    
    mutating func removeFirst() -> T? {
        if head == nil { return nil }
        
        let removeElement = head?.data
        head = head?.next
        return removeElement
    }
    
    mutating func removeAll() {
        head = nil
    }
}
