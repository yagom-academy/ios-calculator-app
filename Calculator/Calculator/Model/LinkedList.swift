//
//  LinkedList.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

struct LinkedList<T> {
    var head: Node<T>?
    
    mutating func append(_ element: Node<T>) {
        if head == nil {
            head = element
            return
        }
        
        var node = head
        
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = element
    }
}
