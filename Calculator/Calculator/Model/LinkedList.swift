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
    
    mutating func append(_ item: Element) {
        let newNode = Node(item)
        
        guard let lastNode = tail else {
            head = newNode
            return
        }
        lastNode.next = newNode
    }
    
    func removeFirst() -> Element? {
        return head?.value
    }
}
