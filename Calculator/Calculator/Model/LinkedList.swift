//
//  CalculatorDataStructure.swift
//  Calculator
//
//  Created by 고은 on 2021/11/09.
//

import Foundation

class Node<T> {
    let value: T?
    var next: Node?
    
    init(value: T?, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList<T: Equatable> {
    private(set) var head: Node<T>?
    
    func insert(_ value: T?) {
        if head == nil {
            head = Node(value: value)
            return
        }
        
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        
        current?.next = Node(value: value)
    }
    
    func delete(_ value: T?) {
        if head?.value == value {
            head = head?.next
        }
        
        var previous: Node<T>?
        var current = head
        
        while current != nil && current?.value != value {
            previous = current
            current = current?.next
        }
        
        previous?.next = current?.next
    }
    
    func elements() -> [T] {
        var listItems = [T]()
        var current = head
        while let currentValue = current?.value {
            listItems.append(currentValue)
            current = current?.next
        }
        
        return listItems
    }
}
