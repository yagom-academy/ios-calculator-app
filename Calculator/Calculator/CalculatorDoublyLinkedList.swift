//
//  CalculatorDoublyLinkedList.swift
//  Calculator
//
//  Created by Eddy on 2022/03/16.
//

import Foundation

class CalculatorDoublyLinkedList<T>: CalculateItem {
    var headNode: Node<T>?
    var tailNode: Node<T>?
    
    public init() { }
    
    public var isEmpty: Bool {
        if headNode == nil || tailNode == nil {
            return true
        }
        return false
    }
    
    public var firstNode: Node<T>? {
        return headNode
    }
    
    public var countNodes: Int {
        var nodeCount = 0
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
    
    public func appendNodes(_ value: T) {
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
    
    public func removeNode(_ node: Node<T>) -> T {
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
    
    public func resetAll() {
        headNode = nil
        tailNode = nil
    }
}
