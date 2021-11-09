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
        
        guard head != nil else {
            head = newNode
            return
        }
    }
}
