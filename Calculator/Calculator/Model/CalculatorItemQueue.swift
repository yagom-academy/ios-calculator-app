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

extension Int: CalculateItem {
    
}

struct CalculatorItemQueue<T: CalculateItem> {
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
    
    func isEmpty() -> Bool {
        if head == nil {
            return true
        } else {
            return false
        }
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }    
    
    func count() -> Int {
        var count = 0
        guard !isEmpty() else {
            return count
        }
        count += 1
        var currentNode = head
        
        while currentNode?.next != nil {
            count += 1
            currentNode = currentNode?.next
        }
        return count
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
