//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 서현웅 on 2022/09/20.
//

import Foundation

protocol CalculateItem {
}

struct CalculatorItemQueue: CalculateItem {
    var queue: [String] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: String) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> String? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    public mutating func clear() {
        queue.removeAll()
    }
}
