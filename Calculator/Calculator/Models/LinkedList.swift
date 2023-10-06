//
//  LinkedList.swift
//  Calculator
//
//  Created by Toy on 10/6/23.
//


final class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool { head == nil }
    
    var first: T? { head?.data }
    
    var last: T? { tail?.data }
    
    func append(value: T) {
        if head == nil {
            head = Node(data: value)
            count += 1
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: value)
        count += 1
    }
    
    func removeFirst() -> T? {
        guard !isEmpty else { return nil }
        
        let node = head?.data
        head = head?.next
        count -= 1
        
        return node
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}
