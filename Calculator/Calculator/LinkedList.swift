//  LinkedList.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/15.

import Foundation

final class LinkedList {
    var head: Node?
    var tail: Node?
    
    init(head: Node? = nil) {
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
    
    func append(data: Int?) {
        if head == nil {
            head = Node(data: data)
            tail = head
            return
        }
        let lastNode = Node(data: data)
        tail?.next = lastNode
        tail = lastNode
    }
    
    func removeFirst() -> Int? {
        if head == nil { return nil }
        
        if head?.next == nil {
            let lastData = head?.data
            head = nil
            return lastData
        }
        let data = head?.data
        head = head?.next
        return data
    }
}
