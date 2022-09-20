//
//  Node.swift
//  Calculator
//
//  Created by 맹선아 on 2022/09/19.
//

import Foundation

struct LinkedList {
    var head: Node<String>?
    var last: Node<String>? {
        var currentNode = head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        return currentNode
    }
    
    mutating func append(_ data: String) {
        guard self.head != nil else {
            self.head = Node(data: data)
            return
        }
        
        var currentNode = head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        currentNode?.next = Node(data: data)
    }
    
    mutating func removeLast() {
        guard self.head != nil else {
            return
        }
        
        guard self.head?.next != nil else {
            self.head = nil
            return 
        }
        
        var currentNode = head
        
        while currentNode?.next?.next != nil {
            currentNode = currentNode?.next
        }
        
        currentNode?.next = nil
    }
    
    mutating func removeFirst() {
        var currentNode = head
        
        head = currentNode?.next
        currentNode = nil
    }
}



