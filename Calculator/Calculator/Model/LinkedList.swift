//
//  LinkedList.swift
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
    
    private(set) var head: Node<T>?
    private(set) var nodeCount: Int = 0
    var isEmpty: Bool {
        if nodeCount == 0 {
            return true
        } else {
            return false
        }
    }
    
    mutating func append(_ element: T) {
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
    
    mutating func removeFirst() {
        head = head?.next
        nodeCount -= 1
    }
    
    mutating func removeLast() {
        if head == nil { return }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        
        node = nil
        nodeCount -= 1
    }
    
    mutating func removeAll() {
        head = nil
        nodeCount = 0
    }
    
    init() {}
}
