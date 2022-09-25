//
//  CalculatorItemQueue.swift
//  Calculator
//

struct LinkedList<T> {
    class Node<T>: CalculateItem {
        var value: T
        var next: Node?
        
        fileprivate init(_ value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    fileprivate(set) var head: Node<T>?
    fileprivate var nodeCount: Int = 0
    fileprivate var isEmpty: Bool {
        if nodeCount == 0 {
            return true
        } else {
            return false
        }
    }
    
    fileprivate mutating func append(_ element: T) {
        guard isEmpty == false else {
            head = Node(element)
            nodeCount += 1
            return
        }

        var node = head
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = Node(element)
        nodeCount += 1
    }
    
    fileprivate mutating func removeFirst() {
        head = head?.next
        nodeCount -= 1
    }
    
    fileprivate mutating func removeLast() {
        if head == nil { return }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        
        node = nil
        nodeCount -= 1
    }
    
    fileprivate mutating func removeAll() {
        head = nil
        nodeCount = 0
    }
    
    fileprivate init() {}
}

struct CalculatorItemQueue<T> {
    var list: LinkedList<T> = LinkedList<T>()
    
    var count: Int {
        return list.nodeCount
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    mutating func dequeue() {
        list.removeFirst()
    }
    
    mutating func removeAll() {
        list.removeAll()
    }
}
