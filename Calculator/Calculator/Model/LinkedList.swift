//
//  LinkedList.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/09.
//

import Foundation

class LinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
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
        nodeCount += 1
        while let currentNode = node.next {
            nodeCount += 1
            node = currentNode
        }
        return nodeCount
    }
    
    func append(_ item: Element) {
        let newNode = Node(item)
        
        guard let node = tail else {
            head = newNode
            tail = newNode
            return
        }
        
        node.next = newNode
        tail = newNode
    }
    
    func removeFirst() -> Element? {
        let removedNodeValue = head?.value
        let nextHeadNode = head?.next
    
        head = nextHeadNode
        tail = head == nil ? head: tail
        return removedNodeValue
    }
}
