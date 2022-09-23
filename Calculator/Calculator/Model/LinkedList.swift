//
//  LinkedList.swift
//  Calculator
//
//  Created by Hamo on 2022/09/20.
//

struct LinkedList<Element: CalculateItem> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
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
        let result = head?.bringData()
        
        if head?.bringNextNode() == nil {
            tail = nil
        }
        
        self.head = head?.bringNextNode()
        return result
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    func bringHead() -> Node<Element>? {
        return head
    }
    
    func bringTail() -> Node<Element>? {
        return tail
    }
}

