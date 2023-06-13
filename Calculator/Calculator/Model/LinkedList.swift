//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by karen on 2023/06/07.
//

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Element? {
        return head?.data
    }
    
    var last: Element? {
        return tail?.data
    }
    
    mutating func append(data: Element) {
        let newNode = Node(data: data)
        
        if head == nil {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
    
    mutating func removeFirst() -> Element? {
        guard let firstNode = head else { return nil }
        
        head = firstNode.next
        if head == nil {
            tail = nil
        }
        return firstNode.data
    }
}
