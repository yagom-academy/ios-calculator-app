//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by MARY on 2023/05/30.
//

protocol CalculateItem { }

struct CalculatorItemQueue: CalculateItem {
    var itemQueue: [String] = []
    
    mutating func enqueue(_ element: String) {
        itemQueue.append(element)
    }
    
    mutating func dequeue() -> String? {
        return itemQueue.isEmpty ? nil : itemQueue.removeFirst()
    }
    
    mutating func resetQueue() {
        itemQueue = []
    }
}
