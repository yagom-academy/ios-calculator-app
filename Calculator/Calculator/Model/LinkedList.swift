//
//  LinkedList.swift
//  Calculator
//
//  Created by Dasan on 2023/05/30.
//

class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var count: Int = 0
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: T? {
        return head?.data
    }
    
    var last: T? {
        return tail?.data
    }
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
        
        if head != nil {
            count += 1
            self.tail = head
        }
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
}
