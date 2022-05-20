//
//  DoublyLinkedList.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/17.
//

import Foundation

final class DoublyLinkedList<T: Equatable> {
    private var head: Node<T>?
    private weak var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node<T>? {
        return head
    }
    
    var last: Node<T>? {
        return tail
    }
}

extension DoublyLinkedList {
    subscript(index: Int) -> T? {
        guard var node = self.head else {
            return nil
        }
        
        if index == 0 {
            return node.value
        }
        
        for _ in 1...index {
            allocate(to: &node)
        }
        return node.value
    }
}

private extension DoublyLinkedList {
    func allocate(to currentNode: inout Node<T>) {
        if let nextCurrentNode = currentNode.next {
            currentNode = nextCurrentNode
        }
    }
    
    @discardableResult
    func compare(node: Node<T>, and value: T) -> Bool {
        guard node.value == value else {
            return false
        }
        return true
    }
    
    @discardableResult
    func allocate(_ value: T, to node: inout Node<T>) -> Bool {
        guard let next = node.next else {
            return false
        }
        node = next
        return false
    }
}

extension DoublyLinkedList {
    func append(_ value: T) {
        let newNode = Node(value: value)
        
        guard let tailNode = tail else {
            head = newNode
            tail = newNode
            return
        }
        
        newNode.previous = tailNode
        tailNode.next = newNode
        tail = newNode
    }
    
    func size() -> Int {
        guard var node = self.head else {
            return 0
        }
        
        var count = 1
        while let nextNode = node.next {
            count += 1
            node = nextNode
        }
        return count
    }
    
    func contains(_ value: T) -> Bool {
        guard var node = self.head else {
            return false
        }
        
        while true {
            compare(node: node, and: value)
            allocate(value, to: &node)
        }
    }
    
    func remove(_ node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
