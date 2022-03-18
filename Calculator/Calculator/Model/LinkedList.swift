//  LinkedList.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/15.

import Foundation

final class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
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
        let lastNode = Node(data: data)
        if head == nil {
            head = lastNode
            tail = head
        } else {
            tail?.next = lastNode
            tail = lastNode
        }
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func removeFirst() -> T? {
        if isEmpty { return nil }
        let lastData = head?.data
        head = head?.next
        return lastData
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
