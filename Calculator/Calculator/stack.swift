//
//  stack.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/26.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

struct Stack<T> {
    var head: Node<T>?
    
    mutating func push(_ value: T) {
        let node = Node<T>(value: value)
        if let nodeHead = head {
            node.next = nodeHead
            
            head = node
        } else {
            head = node
        }
    }
    
    mutating func pop() -> Node<T>? {
        if let nodeHead = head{
            let node = nodeHead
            head = nodeHead.next
            node.next = nil
            return node
        }
        return nil
    }
    func isEmpty() -> Bool {
        return head == nil
    }
    func peek() -> Node<T>? {
        return head
    }
}

