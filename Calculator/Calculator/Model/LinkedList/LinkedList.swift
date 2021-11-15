//
//  LinkedList.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

struct LinkedList {
    
    // MARK: private property
    private var head: Node?
    private var tail: Node?
}

// MARK: internal method
extension LinkedList {
    
    mutating func append(data: CalculateItem) {
        let newNode = Node(data: data)
        
        if tail != nil {
            tail?.next = newNode
        }
        tail = newNode
        
        if head == nil {
            self.head = tail
        }
    }
    
    mutating func removeFrist() -> CalculateItem? {
        if head == nil {
            return nil
        }
        
        let removedData = head?.data
        self.head = head?.next
      
        return removedData
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
    
    func front() -> Node? {
        return self.head
    }
}
