//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Danny on 2/5/24.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    private var list: [T] = []
    
    public var count: Int {
        return list.count
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return list.removeFirst()
    }
    
    public func showQueue() -> [T] {
        return list
    }
}
