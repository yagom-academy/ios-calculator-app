//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Baem on 2022/09/20.
//

struct CalculatorItemQueue {
    private var queue: [CalculatorItem] = []
    var isEmpty: Bool {
        return queue.isEmpty
    }
    var count: Int {
        return queue.count
    }
    
    mutating func enqueue(_ element: CalculatorItem) {
        queue.append(element)
    }
    
    mutating func dequeue() -> CalculatorItem? {
        if queue.isEmpty {
            return nil
        }
        
        return queue.removeFirst()
    }
    
    func peek() -> CalculatorItem? {
        return queue.first
    }
    
    mutating func clear() {
        queue = []
    }
}

