//
//  LinkedList.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/05/31.
//

struct LinkedList<T> {
    private var firstNode: Node<T>?
    private var lastNode: Node<T>?
    
    var first: Node<T>? {
        return firstNode
    }
    
    var last: Node<T>? {
        return lastNode
    }

    private var isEmpty: Bool {
        return firstNode == nil
    }

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
