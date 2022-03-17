//
//  LinkedList.swift
//  Calculator
//
//  Created by DuDu on 2022/03/16.
//

class LinkedList<Element: CalculateItem> {
    private(set) var head: Node<Element>?
    private(set) var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ data: Element) {
        let newNode = Node(data: data)
        
        if head == nil {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    func removeFirst() -> Element? {
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
    
    func removeAll() {
        head = nil
        tail = nil
    }
}

