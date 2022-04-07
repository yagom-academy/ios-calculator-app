//
//  CalculatorDoublyLinkedList.swift
//  Calculator
//
//  Created by Tiana, Eddy and Red on 2022/03/16.
//

import Foundation

final class CalculatorDoublyLinkedList<T> {
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
        let newNode = Node<T>(value: value)
        if let tail = tailNode {
            newNode.prev = tail
            tail.next = newNode
            tailNode = newNode
        } else {
            headNode = newNode
            tailNode = newNode
        }
    }
    
    func removeNode() -> T? {
        if isEmpty { return nil }
        let lastData = headNode?.value
        headNode = headNode?.next
        return lastData
    }
    
    func resetAll() {
        headNode = nil
        tailNode = nil
    }
}
