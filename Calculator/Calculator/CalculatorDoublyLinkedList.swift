//
//  CalculatorDoublyLinkedList.swift
//  Calculator
//
//  Created by Eddy on 2022/03/16.
//

import Foundation

class CalculatorDoublyLinkedList<T> {
    private var headNode: Node<T>?
    private var tailNode: Node<T>?
    
    var isEmpty: Bool {
        return headNode == nil || tailNode == nil
    }
    
    var firstNode: Node<T>? {
        return headNode
    }
    
    var countNodes: Int {
        var nodeCount = 1
        guard var node = headNode else {
            nodeCount = 0
            return nodeCount
        }
        while let nextNode = node.next {
            node = nextNode
            nodeCount += 1
        }
        return nodeCount
    }
    
    func appendNodes(_ value: T) {
        let newNode = Node(value: value)
        if let tail = tailNode {
            newNode.prev = tail
            tail.next = newNode
            tailNode = newNode
        } else {
            headNode = newNode
            tailNode = newNode
        }
    }
    
    func removeNode(_ node: Node<T>) -> T {
        let previous = node.prev
        let next = node.next
        
        if let previous = previous {
            previous.next = next
            next?.prev = previous
        } else {
            headNode = next
        }
        
        if let next = next {
            previous?.next = next
        } else {
            tailNode = previous
        }
        return node.value
    }
    
    func resetAll() {
        headNode = nil
        tailNode = nil
    }
}
