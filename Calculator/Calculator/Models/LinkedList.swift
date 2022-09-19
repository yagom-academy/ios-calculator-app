//
//  LinkedList.swift
//  Calculator
//
//  Created by Kyo on 2022/09/19.
//

import Foundation

struct LinkedList {
    var head: Node?
    var tail: Node?
    var count: Int = 0
    
    mutating func append(data: String) {
        let node: Node = Node(data)
        
        if count == 0 {
            head = node
        } else {
            tail?.setNextNode(node: node)
        }
        
        count += 1
        tail = node
    }
    
    mutating func removeFirst() -> String? {
        let removeItem: Node? = head
        self.head = head?.getNextNode()
        count -= 1
        
        return removeItem?.data
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
