//
//  CalculatorItemQueue.swift
//  Calculator
//

protocol CalculateItem { }

class LinkedList<T> {
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
    
    func append(_ element: T) {
        let newNode: Node = Node(element)
        
        guard isEmpty == false else {
            head = newNode
            tail = newNode
            nodeCount += 1
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
    
    func removeLast() {
        tail = nil
        nodeCount -= 1
    }
    
    func removeAll() {
        head = nil
        tail = nil
        nodeCount = 0
    }
}

struct CalculatorItemQueue<T> {
    var list: LinkedList<T> = LinkedList<T>()
    
    var count: Int {
        return list.nodeCount
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    func enqueue(_ element: T) {
        list.append(element)
    }
    
    func dequeue() {
        list.removeLast()
    }
    
    func removeAll() {
        list.removeAll()
    }
}
