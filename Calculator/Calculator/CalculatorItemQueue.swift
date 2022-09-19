//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/19.
//


struct CalculatorItemQueue : CalculateItem {
    
    private var queue: [Double] = []
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: Double) {
        queue.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Double? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}
