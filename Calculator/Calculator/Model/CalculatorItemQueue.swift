//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by hyunMac on 10/4/23.
//
import Foundation

struct CalculatorItemQueue<T: CalculatorItem> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private var nodeCount = 0
    
    mutating func enqueue(_ elemnet: T) {
        let newNode = Node(elemnet)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.setNext(newNode)
            tail = newNode
        }
        nodeCount += 1
    }
    
    mutating func dequeue() -> T? {
        guard let dequeuedElement = head?.element else {
            return nil
        }
        head = head?.next
        nodeCount -= 1
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
        return nodeCount
    }
    
}

final class Node<T> {
    private(set) var next: Node<T>?
    private(set) var element: T
    
    init(_ element: T) {
        self.next = nil
        self.element = element
    }
    
    func setNext(_ node: Node<T>) {
        self.next = node
    }
}
