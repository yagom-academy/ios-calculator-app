//
//  LinkedList.swift
//  Calculator
//
//  Created by mint, Whales on 2023/06/12.
//

struct LinkedList<T> {
    private var head: Node<T>?
    private weak var tail: Node<T>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    var headData: T? {
        head?.data
    }
    
    var tailData: T? {
        tail?.data
    }
    
    mutating func append(data: T) {
        let newNode = Node(data: data)
        
        if isEmpty {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    @discardableResult
    mutating func removeFirst() -> T? {
        let data = head?.data
       
        head = head?.next
        
        return data
    }
    
    mutating func removeAll() {
        guard !isEmpty else {
            return
        }
        
        head = nil
        tail = nil
    }
}
