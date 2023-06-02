//
//  LinkedList.swift
//  Calculator
//
//  Created by Whales on 2023/06/03.
//

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T? = nil, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var count: Int = 0
    
    var isEmpty: Bool {
        head == nil
    }
    
    func readHeadData() -> T? {
        return head?.data
    }
    
    func readTailData() -> T? {
        return tail?.data
    }
    
    func append(data: T?) {
        if isEmpty {
            head = Node(data: data)
            tail = head
            count += 1
            return
        }
        
        let newNode = Node(data: data)
        tail?.next = newNode
        tail = newNode
        count += 1
    }
    
    func insert(data: T?, at index: UInt) {
        if index >= count {
            return
        } else if index == 0 {
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
    
    func removeFirst() {
        if isEmpty {
            return
        }
        
        if count == 1 {
            head = nil
            tail = nil
            count = 0
            return
        }
        
        head = head?.next
        count -= 1
    }
    
    func removeLast() {
        if isEmpty {
            return
        }
        
        if count == 1 {
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
    
    func delete(at index: UInt) {
        if isEmpty || index >= count {
            return
        }
        
        if index == 0 {
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
    
    func removeAll() {
    }
}
