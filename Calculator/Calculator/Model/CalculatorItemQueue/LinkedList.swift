//
//  LinkedList.swift
//  Calculator
//
//  Created by Dasan on 2023/05/30.
//

final class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: T? {
        return head?.data
    }
    
    var last: T? {
        return tail?.data
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
    }
    
    mutating func removeFirst() -> T? {
        guard head != nil else { return nil }
        
        let removedData = head?.data
        
        head = head?.next
        
        if head == nil { tail = nil }
        
        return removedData
    }
}
