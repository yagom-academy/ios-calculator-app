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
    
    var last: Node<T>? {
        return tail
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var isNotEmpty: Bool {
        return head != nil
    }
    
    mutating func append(_ item: T) {
        let newNode = Node(item: item)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    mutating func retrieveHeadValue() -> T? {
        if let removedHead = removeHead() {
            return removedHead.item
        }
        return nil
    }
    
    private mutating func removeHead() -> Node<T>? {
        guard let oldHead = head else {
            return nil
        }
        head = oldHead.next
        return oldHead
    }
    
    mutating func removeAll() {
        head = nil
    }
}
