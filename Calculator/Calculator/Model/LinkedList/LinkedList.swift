//
//  LinkedList.swift
//  Calculator
//
//  Created by 허건 on 2022/05/18.
//

struct LinkedList<T> {
    var head: Node<T>?
    
    mutating func append(data: T?) {
        let newNode = Node(data: data)
        
        guard let node = head else {
            head = newNode
            return
        }

        node.next = newNode
    }
    
    mutating func removeFirst() {
        if head == nil && head?.next == nil {
            head = nil
            return
        }
        head = head?.next
    }
    
    mutating func removeAll() {
        head = nil
    }
}
