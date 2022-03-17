//  LinkedList.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/15.

import Foundation

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    init(head: Node<T>? = nil) {
        self.head = head
        self.tail = head
    }
    
    var count: Int {
        guard var node = self.head else {
            return 0
        }
        var count = 1
        while node.next != nil {
            count += 1
            node = node.next!
        }
        return count
    }
    
    func append(data: T) {
        if head == nil {
            head = Node(data: data)
            tail = head
            return
        } else {
            let lastNode = Node(data: data)
            tail?.next = lastNode
            tail = lastNode
        }
    }
    
    func removeFirst() -> T? {
        if head?.next == nil {
            let lastData = head?.data
            head = nil
            return lastData
        } else {
            let data = head?.data
            head = head?.next
            return data
        }
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    func bringHead() -> Node<T>? {
        return head
    }
    
    func bringTail() -> Node<T>? {
        return tail
    }
    
    func asignNilToHead() {
        head = nil
    }
}
