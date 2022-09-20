//
//  Calculator - ViewController.swift
//  Created by inho.
//  Copyright © yagom. All rights reserved.
//

import Foundation

class CalculatorItemQueue<T>: CalculateItem {
    private(set) var head: Node<T>? = nil
    
    func enqueue(element: T?) {
        if head == nil {
            head = Node(data: element)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: element)
    }
    
    func dequeue() -> T? {
        guard let currentHead = head else {
            return nil
        }
        
        head = currentHead.next
        return currentHead.data
    }
    
    func removeAll() {
        guard let currentHead = head else {
            return
        }
        
        while head != nil {
            head = nil
            let nextHead = currentHead.next
            head = nextHead
        }
    }
}

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
