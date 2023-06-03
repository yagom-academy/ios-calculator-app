//
//  LinkedList.swift
//  Calculator
//
//  Created by MARY on 2023/05/31.
//

struct LinkedList<Element> {
    private var front: Node<Element>?
    private var rear: Node<Element>?
    private(set) var size: Int = 0
    var isEmpty: Bool { size == 0 }
    var peek: Element? { front?.element }
    
    mutating func append(_ element: Element) {
        let newNode = Node(element: element)
        
        if isEmpty {
            front = newNode
            rear = newNode
        } else {
            rear?.next = newNode
            rear = newNode
        }
        size += 1
    }
    
    mutating func removeFirst() -> Element? {
        guard let firstElement = front?.element else { return nil }
        
        front = front?.next
        size -= 1
        
        if isEmpty {
            front = nil
            rear = nil
        }
        
        return firstElement
    }
    
    mutating func removeAll() {
        front = nil
        rear = nil
        size = 0
    }
}
