//
//  LinkedList.swift
//  Calculator
//
//  Created by NAMU on 2022/05/17.
//

class LinkedList<T> {
    var head: Node<T>?
    
    func append(data: T) {
        if head == nil {
            head = Node(data: data, next: nil)
            return
        }
        
        var node = head
        
        while node?.next != nil {
            node = head?.next
        }
        node?.next = Node(data: data, next: nil)
    }
    
    func removeAndReturnFirst() -> T? {
        return nil
    }
    
    func isEmpty() -> Bool {
        return false
    }
}
