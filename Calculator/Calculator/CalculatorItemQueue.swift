//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by MARY on 2023/05/30.
//

protocol CalculateItem { }

final class CalculatorItemQueue: CalculateItem {
    var itemQueue: [String] = []
    private var size: Int {
        return itemQueue.count
    }
    
    func enqueue(_ element: String) {
        itemQueue.append(element)
    }
    
    func dequeue() -> String? {
        guard !itemQueue.isEmpty else { return nil }
        
        var newItemQueue: [String] = itemQueue.reversed()
        let element = newItemQueue.removeLast()
        itemQueue = newItemQueue.reversed()
        
        return element
    }
    
    func resetQueue() {
        itemQueue = []
    }
}
