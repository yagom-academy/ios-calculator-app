//
//  LinkedList.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/09.
//

import Foundation

class LinkedList<T> {
    class Node<T> {
        var value: T
        var next: Node<T>?
        
        init(value: T) {
          self.value = value
        }
    }
    
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node<T>? {
        guard let headValue = head else {
            return nil
        }
        return headValue
        return head
    }
    
    var last: Node<T>? {
        return tail
    }
    
    func append(_ value: T) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        self.tail = newNode
    }
    
}
