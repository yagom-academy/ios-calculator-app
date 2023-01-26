//  Queue.swift
//  Created by 레옹아범 on 2023/01/24.

struct LinkedList<Element: CalculateItem> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var isEmpty: Bool {
        return self.head == nil
    }
    
    mutating func append(_ element: Element) {
        if isEmpty {
            self.head = Node(value: element)
            self.tail = self.head
            return
        }
        
        let node = Node(value: element)
        self.tail?.next = node
        self.tail = node
    }
    
    mutating func removeFirst() -> Element? {
        if isEmpty {
            return nil
        }
        
        let value = self.head?.value
        self.head = self.head?.next
        
        return value
    }
    
    mutating func removeAll() {
        self.head = nil
        self.tail = nil
    }
}
