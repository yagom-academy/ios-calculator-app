//
//  Node.swift
//  Calculator
//
//  Created by 맹선아 on 2022/09/19.
//

import Foundation

class Node <T> {
    var data: T?
    var next: Node?
    
    init (data: T?, next: Node? = nil) {
        self .data = data
        self .next = next
    }
}

struct LinkedList<Int>{
    var head: Node<Int>?
    
    mutating func append(_ data: Int) {
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
    
    func removeFirst() {
        
    }
}



