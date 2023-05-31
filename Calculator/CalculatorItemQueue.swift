//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yetti on 2023/05/30.
//
protocol Queue {
    mutating func enQueue(_ data: String)
    mutating func deQueue() -> String?
    func peek() -> String?
    func isEmpty() -> Bool
    mutating func clear()
}
protocol CalculateItem { }

struct CalculatorItemQueue: Queue, CalculateItem {
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
    
    func isEmpty() -> Bool {
        <#code#>
    }
}
