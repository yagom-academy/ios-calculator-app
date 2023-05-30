//
//  LinkedList.swift
//  Calculator
//
//  Created by idinaloq on 2023/05/29.
//

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var headData: T? {
        return head?.data
    }
    var tailData: T? {
        return tail?.data
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(data: T?) {
        let node: Node = Node(data: data)
        if isEmpty {
            head = node
            tail = head
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    
    
}
