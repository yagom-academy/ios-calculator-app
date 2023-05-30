//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박종화 on 2023/05/30.
//

import Foundation

struct CalculatorItemQueue<T>: CalculatorItem {
    private var queue: [T] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    public mutating func clear() {
        queue.removeAll()
    }
}
