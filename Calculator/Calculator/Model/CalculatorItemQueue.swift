//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Baem on 2022/09/20.
//

struct CalculatorItemQueue {
    private var queue: [CalculatorItem] = [CalculatorItem]()
    var isEmpty: Bool {
        return queue.isEmpty ? false : true
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
        queue.removeFirst()
        
        return queue.first
    }
}

