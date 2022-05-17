//
//  LinkedList.swift
//  Calculator
//
//  Created by NAMU on 2022/05/17.
//
 class Node<T> {
     fileprivate var data: T?
     fileprivate var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {
    private var head: Node<T>?
    
    func confirmFirst() -> T? {
        return head?.data
    }
    
    mutating func append(data: T) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        
        while node?.next != nil {
            node = head?.next
        }
        node?.next = Node(data: data)
    }
    
    mutating func takeOutFirst() -> T? {
        let result = head
        head = head?.next
        return result?.data
    }
    
    func isEmpty() -> Bool {
        if head == nil {
            return true
        }
        return false
    }
    
    func removeAll() {
        
    }
}
