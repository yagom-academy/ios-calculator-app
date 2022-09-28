//
//  Calculator - ViewController.swift
//  Created by inho.
//  Copyright © yagom. All rights reserved.
//

import Foundation

class CalculatorItemQueue<T> {
    private(set) var head: Node<T>? = nil
    var last: Node<T>? {
        guard head != nil else {
            return nil
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        return node
    }
    var isEmpty: Bool {
        guard head != nil else {
            return true
        }
        
        return false
    }
    
    func enqueue(element: T) {
        guard let lastNode = last else {
            head = Node(data: element)
            return
        }
        
        lastNode.next = Node(data: element)
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
        
        head = nil
    }
}

