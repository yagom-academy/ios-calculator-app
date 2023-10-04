//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Toy on 10/5/23.
//

import Foundation

struct CalculatorItemQueue<T> {
    private var elements: [T] = []
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        if elements.isEmpty {
            return nil
        } else {
            return elements.removeFirst()
        }
    }
    
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    func count() -> Int {
        return elements.count
    }
    
    func peek() -> T? {
        return elements.first
    }
}
