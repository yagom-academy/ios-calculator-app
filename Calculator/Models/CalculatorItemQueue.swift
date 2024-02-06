//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yejin Hong on 2024/02/05.
//

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    init() {}
    
    var isEmpty: Bool {
        head == nil
    }
    
    mutating func append(_ value: T) {
        guard !isEmpty else {
            head = Node(value: value)
            tail = head
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    mutating func pop() -> T? {
        guard let head = self.head else {
            return nil
        }
        
        if head.next == nil {
            self.head = nil
            return head.value
        }
        
        self.head = head.next
        return head.value
    }
    
    mutating func insert(_ value: T, at index: Int) {
        let newNode = Node(value: value)
        
        if index == 0 {
            newNode.next = head
            head = newNode
            return
        }
        
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index - 1 {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        if currentNode == nil {
            return
        }
        
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    mutating func clear() {
        if head == nil {
            return
        }
        
        head = nil
    }
}

class CalculatorItemQueue<T> {
    var list = LinkedList<T>()
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    func dequeue() -> T? {
        return list.pop()
    }
    
    func enqueue(_ value: T) {
        list.append(value)
    }
    
    func insert(_ value: T, at index: Int) {
        list.insert(value, at: index)
    }
    
    func clear() {
        list.clear()
    }
}
