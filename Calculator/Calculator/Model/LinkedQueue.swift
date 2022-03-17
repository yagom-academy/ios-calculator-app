//
//  LinkedListQueue.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/17.
//

import Foundation

class Node<Element: CalculateItem> {
    var value: Element?
    var next: Node<Element>?
    
    init(value: Element?, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedQueue<Element: CalculateItem> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node<Element>? {
        return head == nil ? nil : head
    }
    
    var last: Node<Element>? {
        return tail == nil ? nil : tail
    }
    
    mutating func removeFirst() -> Node<Element>? {
        if head == nil {
            return nil
        }
        
        defer {
            let nextHead = head?.next
            head = nil
            head = nextHead
        }
        return head
    }
    
    mutating func removeFirst() {
        if head == nil {
            return
        }
        
        let nextHead = head?.next
        head = nil
        head = nextHead
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
