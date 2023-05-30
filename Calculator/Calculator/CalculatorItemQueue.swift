//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by MARY on 2023/05/30.
//

protocol CalculateItem { }

final class CalculatorItemQueue: CalculateItem {
    private(set) var itemQueue: [String] = []
    
    func enqueue(_ element: String) {
        itemQueue.append(element)
    }
    
    func dequeue() -> String? {
        guard !itemQueue.isEmpty else { return nil }
        
        var newItemQueue = Array(itemQueue.reversed())
        let element = newItemQueue.removeLast()
        itemQueue = newItemQueue.reversed()
        
        return element
    }
    
    func resetQueue() {
        itemQueue = []
    }
}
