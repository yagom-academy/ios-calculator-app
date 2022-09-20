//
//  Calculator - ViewController.swift
//  Created by inho.
//  Copyright © yagom. All rights reserved.
//

import Foundation

protocol CalculateItem {
    
}

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
}

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
