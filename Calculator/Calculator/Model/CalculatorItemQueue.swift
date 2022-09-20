//
//  CalculatorItemQueue.swift
//  Calculator
//

protocol CalculateItem { }

private struct LinkedList<T> {
    class Node<T>: CalculateItem {
        var value: T
        var next: Node?
        
        init(_ value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    var head: Node<T>?
    var tail: Node<T>?
    var nodeCount: Int = 0
    var isEmpty: Bool {
        if nodeCount == 0 {
            return true
        } else {
            return false
        }
    }
    
    mutating func append(_ element: T) {
        let newNode: Node = Node(element)
        
        guard isEmpty == false else {
            self.head = newNode
            self.tail = newNode
            self.nodeCount += 1
            return
        }
        if nodeCount == 1 {
            tail = newNode
            head?.next = tail
        } else {
            tail?.next = newNode
            tail = newNode
        }
        nodeCount += 1
    }
    
    mutating func removeLast() {
        tail = nil
        nodeCount -= 1
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
        nodeCount = 0
    }
}

struct CalculatorItemQueue<T> {
    private var list: LinkedList<T> = LinkedList<T>()
    
    var count: Int {
        return list.nodeCount
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        self.list.append(element)
    }
    
    mutating func dequeue() {
        self.list.removeLast()
    }
    
    mutating func removeAll() {
        self.list.removeAll()
    }
}
