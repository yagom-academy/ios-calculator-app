//
//  LinkedList.swift
//  Calculator
//
//  Created by Harry on 2023/01/25.
//

struct LinkedList<T> {    
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    var count: Int = 0
    var isEmpty: Bool { head == nil }
    
    mutating func appendLast(_ value: T) {
        if isEmpty {
            head = Node(value: value)
            tail = head
        } else {
            tail?.next = Node(value: value)
            tail = tail?.next
        }
        count += 1
    }
    
    @discardableResult
    mutating func removeFirst() -> T? {
        guard isEmpty == false else { return nil }
        guard let value = head?.value else { return nil }
        
        head = head?.next
        count -= 1
        
        if isEmpty {
            tail = nil
        }
        
        return value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}
