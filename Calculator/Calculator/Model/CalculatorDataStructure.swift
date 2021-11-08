//
//  CalculatorDataStructure.swift
//  Calculator
//
//  Created by 고은 on 2021/11/09.
//

import Foundation

protocol CalculateItem {
}

class Node {
    let value: String
    var next: Node?
    
    init(value: String, next: Node?) {
        self.value = value
        self.next = next
    }
}

class LinkedList {
    var head: Node?
    
    func insert(_ value: String) {
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
    
    func delete(_ value: String) {
        if head?.value == value {
            head = head?.next
        }
        
        var previous: Node?
        var current = head
        
        while current != nil && current?.value != value {
            previous = current
            current = current?.next
        }
        
        previous?.next = current?.next
    }
    
    func test_Elements() -> [String] {
        var listItems = [String]()
        var current = head
        while current != nil {
            listItems.append(current?.value ?? "")
            current = current?.next
        }
        
        return listItems
    }
}
