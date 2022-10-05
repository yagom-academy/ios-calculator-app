//
//  LinkedList.swift
//  Calculator
//
//  Created by Hamo on 2022/09/20.
//

struct LinkedList<Element: CalculateItem> {
    private(set) var head: Node<Element>?
    private(set) var tail: Node<Element>?
    var isEmpty: Bool {
        guard head != nil || tail != nil else {
            return true
        }
        
        return false
    }
    
    mutating func append(_ data: Element) {
        guard head != nil else {
            self.head = Node(data: data)
            self.tail = head
            return
        }
        
        let newElement = Node(data: data)
        self.tail?.setNextNode(destination: newElement)
        self.tail = newElement
    }
    
    mutating func removeFirst() -> Element? {
        let result = head?.data
        
        if head?.next == nil {
            tail = nil
        }
        
        self.head = head?.next
        return result
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}

