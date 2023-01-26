//  Queue.swift
//  Created by 레옹아범 on 2023/01/24.

struct LinkedList<Element: CalculateItem> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var isEmpty: Bool {
        return self.head == nil
    }
    var peek: Element? {
        return self.head?.value
    }
    var back: Element? {
        return self.tail?.value
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
        let value = self.head?.value
        
        if self.head?.next == nil {
            self.tail = nil
        }
        
        self.head = self.head?.next
        
        return value
    }
    
    mutating func removeAll() {
        self.head = nil
        self.tail = nil
    }
}
