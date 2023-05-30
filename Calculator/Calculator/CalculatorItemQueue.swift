//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by MARY on 2023/05/30.
//

protocol CalculateItem { }

final class CalculatorItemQueue: CalculateItem {
    var itemQueue: [String] = []
    
    func enqueue(_ element: String) {
        itemQueue.append(element)
    }
    
    func dequeue() -> String? {
        return itemQueue.isEmpty ? nil : itemQueue.removeFirst()
    }
    
    func resetQueue() {
        itemQueue = []
    }
}
