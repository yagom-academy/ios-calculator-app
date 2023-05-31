//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yetti on 2023/05/30.
//

protocol CalculateItem { }

struct CalculatorItemQueue: CalculateItem {
    var queue: [String] = []
    
    mutating func enQueue(_ data: String) {
        queue.append(data)
    }
    
    mutating func deQueue() -> String? {
        let frontData = (queue == []) ? nil : queue.removeFirst()
        return frontData
    }

    func peek() -> String? {
        let frontData = (queue == []) ? nil : queue[0]
        return frontData
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}
