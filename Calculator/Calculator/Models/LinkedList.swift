//
//  LinkedList.swift
//  Calculator
//
//  Created by Toy on 10/6/23.
//


final class LinkedList<Data> {
    private var head: Node<Data>?
    private var tail: Node<Data>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool { head == nil }
    
    var first: Data? { head?.data }
    
    var last: Data? { tail?.data }
    
    func append(value: Data) {
        let newNode: Node = Node(data: value)
        if isEmpty {
            head = newNode
            tail = head
            count += 1
            return
        } else {
            tail?.next = newNode
            tail = newNode
            count += 1
        }
    }
    
    func removeFirst() -> Data? {
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
