//
//  CalculatorDoublyLinkedList.swift
//  Calculator
//
//  Created by Eddy on 2022/03/16.
//

import Foundation

final class CalculatorDoublyLinkedList<T> {
    var headNode: Node<T>?
    var tailNode: Node<T>?
    
    public init() { }
    
    public var isEmpty: Bool {
        if headNode == nil || tailNode == nil {
            return true
        }
        return false
    }
    
    public var first: Node<T>? {
        return headNode
    }
    
    public func append(_ value: T) {
        let node = Node(value: value)
        if let tail = tailNode {
            node.prev = tail
            tail.next = node
            tailNode = node
        } else {
            headNode = node
            tailNode = node
        }
    }
    
    public func remove(_ node: Node<T>) -> T {
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
