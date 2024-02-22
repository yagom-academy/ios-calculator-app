//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yejin Hong on 2024/02/05.
//

private class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node?) {
        self.value = value
        self.next = next
    }
}

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    private var count: Int {
        var result = 0
        var temp = head
        while temp != nil {
            temp = temp?.next
            result += 1
        }
        return result
    }
    
    mutating func append(_ value: Element) {
        guard !isEmpty else {
            head = Node(value: value)
            tail = head
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    mutating func pop() -> Element? {
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
    
    func peek() -> Element? {
        guard let head = self.head else {
            return nil
        }
        
        return head.value
    }
    
    func size() -> Int {
        return count
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}

struct CalculatorItemQueue<Element: CalculateItem> {
    private var list = LinkedList<Element>()
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    var size: Int {
        list.size()
    }
    
    mutating func dequeue() -> Element? {
        return list.pop()
    }
    
    mutating func enqueue(_ value: Element) {
        list.append(value)
    }
    
    mutating func peek() -> Element? {
        return list.peek()
    }
    
    mutating func clear() {
        list.clear()
    }
}
