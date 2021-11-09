//
//  LinkedList.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/09.
//
import Foundation

class Node<T> {
    var item: T
    var next: Node?
    var previous: Node?
    
    init(item: T) {
        self.item = item
    }
}

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var first: Node<T>? {
        return head
    }
    
    var isNotEmpty: Bool {
        return head != nil
    }
    
    mutating func append(_ item: T) {
        let newNode = Node(item: item)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
}
