//
//  LinkedList.swift
//  Calculator
//
//  Created by Rowan on 2023/01/25.
//

final class Node<T> {
    let data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var count: Int
    
    var headData: T? {
        return self.head?.data
    }
    
    var tailData: T? {
        return self.tail?.data
    }
    
    var isEmpty: Bool { self.count == 0 }
    
    private func generateNode(for data: T) -> Node<T> {
        let node = Node(data: data)
        
        return node
    }
    
    mutating func appendLast(_ data: T) {
        let newNode = generateNode(for: data)
        
        if self.isEmpty {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
        
        count += 1
    }
    
    @discardableResult
    mutating func removeFirst() -> T? {
        guard self.isEmpty == false else { return nil }
        
        let returnValue = head?.data
        head = head?.next
        count -= 1
        
        if self.isEmpty {
            tail = nil
        }
        
        return returnValue
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil, count: Int = 0) {
        self.head = head
        self.tail = tail
        self.count = count
    }
}
