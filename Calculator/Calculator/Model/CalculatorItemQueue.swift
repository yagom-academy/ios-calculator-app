//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by hyunMac on 10/4/23.
//
import Foundation

protocol CalculateItem {
    
}


struct CalculatorItemQueue<T>: CalculateItem {
    var elements: [T] = []
    
    mutating func enqueue(input element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() {
        if !elements.isEmpty {
            elements.removeFirst()
        }
    }
    
    mutating func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    mutating func clear() {
        elements.removeAll()
    }
    
    mutating func peek() -> T? {
        return elements.first
    }
}

class Node<T> {
    var next: Node<T>?
    var element: T
    
    init(element: T) {
        next = nil
        self.element = element
    }
}
