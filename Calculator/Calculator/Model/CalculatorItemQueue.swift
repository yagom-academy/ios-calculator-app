//
//  CalculatorItemQueue.swift
//  Calculator
//

protocol CalculateItem { }

struct LinkedList<T> {
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
    
    func append(node: Node<T>) {
    }
    
    func removeLast(node: Node<T>) {
    }
    
    func removeAll() {
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
    
    func enqueue(_ element: T) {
    }
    
    func dequeue() {
    }
}
