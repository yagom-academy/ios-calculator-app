//
//  Calculator - ViewController.swift
//  Created by inho.
//  Copyright © yagom. All rights reserved.
//

import Foundation

class CalculatorItemQueue<T>: CalculateItem {
    private(set) var head: Node<T>? = nil
    var last: Node<T>? {
        if head == nil {
            return nil
        } else {
            var node = head
            while node?.next != nil {
                node = node?.next
            }
            return node
        }
    }
    
    func enqueue(element: T) {
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
    
    @discardableResult
    func dequeue() -> T? {
        guard let currentHead = head else {
            return nil
        }
        
        head = currentHead.next
        return currentHead.data
    }
    
    func removeAll() {
        guard head != nil else {
            return
        }
        
        while head != nil {
            head = head?.next
        }
    }
}

