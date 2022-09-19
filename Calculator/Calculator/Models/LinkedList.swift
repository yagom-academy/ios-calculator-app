//
//  LinkedList.swift
//  Calculator
//
//  Created by Kyo on 2022/09/19.
//

import Foundation

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var count: Int = 0
    
    mutating func append(data: T) {
        let node: Node<T> = Node(data)
        
        if count == 0 {
            head = node
        } else {
            tail?.setNextNode(node: node)
        }
        
        count += 1
        tail = node
    }
    
    mutating func removeFirst() -> T? {
        let removeItem: Node<T>? = head
        self.head = head?.getNextNode()
        count -= 1
        
        return removeItem?.data
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
