//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Toy on 10/5/23.
//


struct CalculatorItemQueue<T: CalculateItem> {
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
    
    mutating func clear() {
        elements.removeAll()
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
