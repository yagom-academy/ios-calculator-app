//
//  LinkedList.swift
//  Calculator
//
//  Created by Hamo on 2022/09/20.
//

struct LinkedList<Element: CalculateItem> {
    private(set) var head: Node<Element>?
    private(set) var tail: Node<Element>?
    
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
    
    mutating func isEmpty() -> Bool {
        if (head == nil) && (tail == nil) {
            return true
        } else {
            return false
        }
    }
}
