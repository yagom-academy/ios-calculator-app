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
    
    @discardableResult
    func removeFirst() -> Node<T>? {
        if head == nil {
            return nil
        } else {
            let firstNod = head
            head = head?.next
            return firstNod
        }
    }
    
    func removeAll() {
        head = nil
    }
    
}
