//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by karen on 2023/06/07.
//

final class Node<Element> {
    var data: Element
    var prev: Node?
    var next: Node?
    
    init(data: Element) {
        self.data = data
    }
}

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
        
        guard let tailNode = head else {
            head = newNode
            tail = newNode
            return
        }
        newNode.prev = tailNode
        tailNode.next = newNode
        tail = newNode
    }
    
    mutating func removeFirst() {
        guard let firstNode = head else { return }
        
        head = firstNode.next
        if head == nil {
            tail = nil
        } else {
            head?.prev = nil
        }
    }
}
