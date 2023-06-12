//
//  LinkedList.swift
//  Calculator
//
//  Created by mint, Whales on 2023/06/12.
//

final class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var count: Int = 0
    
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
        
        count += 1
    }
    
    mutating func insert(data: T, at index: UInt) {
        guard index < count else {
            return
        }
        
        if index == 0 {
            let newNode = Node(data: data)
            newNode.next = head
            head = newNode
            count += 1
            return
        }
        
        var node = head
        for _ in 0..<(index - 1) {
            if node?.next == nil {
                break
            }
            node = node?.next
        }
        
        let nextNode = node?.next
        let newNode = Node(data: data)
        node?.next = newNode
        node?.next?.next = nextNode
        count += 1
    }
    
    @discardableResult
    mutating func removeFirst() -> T? {
        guard !isEmpty else {
            return nil
        }
        
        let data = head?.data
        
        if count == 1 {
            head = nil
            tail = nil
            count = 0
        } else {
            head = head?.next
            count -= 1
        }
        
        return data
    }
    
    mutating func removeLast() {
        if isEmpty {
            return
        } else if count == 1 {
            head = nil
            tail = nil
            count = 0
            return
        }
        
        var node = head
        while node?.next?.next !== nil {
            node = node?.next
        }
        
        tail = nil
        tail = node
        count -= 1
    }
    
    mutating func delete(at index: UInt) {
        if isEmpty || index >= count {
            return
        } else if index == 0 {
            head = head?.next
            count -= 1
            return
        }
        
        var node = head
        for _ in 0..<(index - 1) {
            if node?.next == nil {
                return
            }
            node = node?.next
        }
        
        node?.next = node?.next?.next
        count -= 1
    }
    
    mutating func removeAll() {
        if isEmpty {
            return
        } else {
            head = nil
            tail = nil
            count = 0
        }
    }
}
