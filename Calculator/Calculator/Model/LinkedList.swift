//
//  LinkedList.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/09.
//

import Foundation

struct LinkedList<Element> {
    var head: Node<Element>?
    
    mutating func append(_ item: Element) {
        let newNode = Node(item)
        
        guard var node = head else {
            head = newNode
            return
        }
        
        while let currentNode = node.next {
            node = currentNode
        }
        
        node.next = newNode
    }
}
