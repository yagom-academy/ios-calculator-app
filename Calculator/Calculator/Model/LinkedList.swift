//
//  LinkedList.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/17.
//

class Node<T> {
    let value: T
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
}

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var count: Int = 0
    
    var isEmpty: Bool {
        return self.head == nil
    }
    
    func returnFirst() -> Node<T>? {
        if let node = head {
            return node
        }
        return nil
    }
    
    mutating func append(_ value: T) {
        let newNode = Node<T>(value)
        
        if let tailNode = tail {
            tail = newNode
            tailNode.next = tail
        } else {
            head = newNode
            tail = newNode
        }
        count += 1
    }
    
    mutating func removeHead() -> Node<T>? {
        if let node = head {
            self.head = head?.next
            count -= 1
            if count == 0 {
                tail = nil
            }
            return node
        } else {
            self.head = nil
            self.tail = nil
            return self.head
        }
    }
    
    mutating func removeAll() {
        self.head = nil
        self.tail = nil
        self.count = 0
    }
}
