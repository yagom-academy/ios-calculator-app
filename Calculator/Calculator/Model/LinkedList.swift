//
//  LinkedList.swift
//  Calculator
//
//  Created by MARY on 2023/05/31.
//

struct LinkedList<Element> {
    private var front: Node<Element>?
    private var tail: Node<Element>?
    private(set) var size: Int = 0
    var isEmpty: Bool { size == 0 }
    
    mutating func append(_ element: Element) {
        let newItem = Node(element: element)
        
        if isEmpty {
            front = newItem
            tail = front
        } else {
            tail?.next = newItem
            tail = newItem
        }
        size += 1
    }
    
    mutating func removeFirst() -> Element? {
        guard let firstElement = front?.element else { return nil }
        
        front = front?.next
        size -= 1
        
        if isEmpty {
            front = nil
            tail = nil
        }
        
        return firstElement
    }
    
    mutating func removeAll() {
        front = nil
        tail = nil
        size = 0
    }
    
    func peek() -> Element? {
        return front?.element
    }
}
