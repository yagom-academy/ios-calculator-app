//
//  LinkedList.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/31.
//

struct LinkedList<T> {
    var head: Node<T>?
    
    mutating func append(_ data: T) {
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
        
        let data = head?.data
        head = head?.next
        
        return data
    }
}
