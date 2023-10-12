//
//  LinkedList.swift
//  Calculator
//
//  Created by Toy on 10/6/23.
//


struct LinkedList<Data> {
    private var head: Node<Data>?
    private var tail: Node<Data>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool { head == nil }
    
    var first: Data? { head?.data }
    
    var last: Data? { tail?.data }
    
    mutating func append(value: Data) {
        let newNode: Node = Node(data: value)
        if isEmpty {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
        count += 1
    }
    
    mutating func removeFirst() -> Data? {
        guard !isEmpty else { return nil }
        
        let value = head?.data
        head = head?.next
        count -= 1
        
        return value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}
