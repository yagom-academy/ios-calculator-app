//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by hyunMac on 10/4/23.
//

// CalculatorItemQueue
import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    mutating func enqueue(_ elemnet: T) {
        let newNode = Node(elemnet)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func dequeue() -> T? {
        guard let dequeuedElement = head?.element else {
            return nil
        }
        head = head?.next
        return dequeuedElement
    }
    
    func peek() -> T? {
        guard let peekElement = head?.element else {
            return nil
        }
        return peekElement
    }
    
}

class Node<T> {
    var next: Node<T>?
    var element: T
    
    init(_ element: T) {
        next = nil
        self.element = element
    }
}
