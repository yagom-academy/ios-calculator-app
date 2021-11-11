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
    
    init(value: T?, next: Node?) {
        self.value = value
        self.next = next
    }
}

class LinkedList<T: Equatable> {
    var head: Node<T>?
    
    func insert(_ value: T?) {
        if head == nil {
            head = Node(value: value, next: nil)
            return
        }
        
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        
        current?.next = Node(value: value, next: nil)
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
    
    func test_Elements() -> [T] {
        var listItems = [T]()
        var current = head
        while let currentValue = current?.value {
            listItems.append(currentValue)
            current = current?.next
        }
        
        return listItems
    }
}
