//
//  LinkedList.swift
//  Calculator
//
//  Created by DuDu on 2022/03/16.
//

struct LinkedList<Element: CalculateItem> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ data: Element) {
        let newNode = Node(data: data)
        
        if head == nil {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func removeFirst() -> Element? {
        if head == nil {
            return nil
        }
        
        let target = head?.data
        
        if head == tail {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }
        
        return target
    }
}

