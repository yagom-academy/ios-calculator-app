//
//  LinkedList.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/09.
//

import Foundation

struct LinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>? {
        guard var node = head else {
            return nil
        }
        
        while let currentNode = node.next {
            node = currentNode
        }
        return node
    }
    var isEmpty: Bool {
        head == nil ? true : false
    }
    var first: Element? {
        head?.value
    }
    var count: Int {
        var nodeCount = 0
        guard var node = head else {
            return nodeCount
        }
        while let currentNode = node.next {
            nodeCount += 1
            node = currentNode
        }
        return nodeCount
    }
    
    mutating func append(_ item: Element) {
        let newNode = Node(item)
        
        guard let lastNode = tail else {
            head = newNode
            return
        }
        lastNode.next = newNode
    }
    
    mutating func removeFirst() -> Element? {
        let removedNodeValue = head?.value
        let nextHeadNode = head?.next
    
        head = nextHeadNode
        return removedNodeValue
    }
}
