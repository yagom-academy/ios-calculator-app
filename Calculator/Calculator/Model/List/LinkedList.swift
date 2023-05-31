//
//  LinkedList.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/05/31.
//

struct LinkedList<T> {
    var firstNode: Node<T>?
    var lastNode: Node<T>?
    
    var isEmpty: Bool { firstNode == nil }
    
    mutating func enqueue(_ element: T) {
        let node = Node(value: element)
        
        if isEmpty {
            firstNode = node
            lastNode = node
        } else {
            lastNode?.previousNode = node
            lastNode = node
        }
    }
    
    mutating func dequeue() -> T? {
        guard let popNode = firstNode else {
            return nil
        }
        
        guard let previousNode = popNode.previousNode else {
            firstNode = nil
            lastNode = nil
            return popNode.value
        }

        firstNode = previousNode
        return popNode.value
    }
}

class Node<T> {
    var value: T
    var previousNode: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}
