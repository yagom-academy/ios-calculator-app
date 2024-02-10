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
    private var head: Node<T>?
    private var tail: Node<T>?
    private var count: Int = 0
    
    var isEmpty: Bool {
        head == nil
    }
    
    init() {}
    
    
    mutating func append(_ value: T) {
        count += 1
        
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
        
        count -= 1
        
        if head.next == nil {
            self.head = nil
            return head.value
        }
        
        self.head = head.next
        return head.value
    }
    
    mutating func peek() -> T? {
        guard let head = self.head else {
            return nil
        }
        
        if head.next == nil {
            return head.value
        }
        
        return head.value
    }
    
    mutating func size() -> Int {
        return count
    }
    
    mutating func clear() {
        if head == nil {
            return
        }
        count = 0
        head = nil
    }
}

class CalculatorItemQueue<T: CalculateItem> {
    var list = LinkedList<T>()
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    var size: Int {
        list.size()
    }
    
    func dequeue() -> T? {
        return list.pop()
    }
    
    func enqueue(_ value: T) {
        list.append(value)
    }
    
    func peek() -> T? {
        return list.peek()
    }
    
    func clear() {
        list.clear()
    }
}
