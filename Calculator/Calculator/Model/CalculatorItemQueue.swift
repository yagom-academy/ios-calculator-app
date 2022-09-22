//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Baem on 2022/09/20.
//

struct CalculatorItemQueue: CalculatorItem {
    private var queue: [String] = [String]()
    
    mutating func enqueue(_ element: String) {
        queue.append(element)
    }
    
    mutating func dequeue() -> String? {
        if queue.isEmpty {
            return nil
        }
        queue.removeFirst()
        
        return queue.first
    }
}
