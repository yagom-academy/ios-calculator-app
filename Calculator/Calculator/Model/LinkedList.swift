//
//  LinkedList.swift
//  Calculator
//
//  Created by Harry on 2023/01/25.
//

struct LinkedList {
    private var head: Node<CalculateItem>?
    private var tail: Node<CalculateItem>?
    var first: CalculateItem? {
        self.head?.value
    }
    var last: CalculateItem? {
        self.tail?.value
    }
    var count: Int = 0
    var isEmpty: Bool { head == nil }
    
    mutating func appendLast(_ value: CalculateItem) {
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
    mutating func removeFirst() -> CalculateItem? {
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

struct StubLinkedList {
    var head: Node<CalculateItem>?
    var tail: Node<CalculateItem>?
    var count: Int = 0
    var isEmpty: Bool { head == nil }

    mutating func appendLast(_ value: CalculateItem) {
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
    mutating func removeFirst() -> CalculateItem? {
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
