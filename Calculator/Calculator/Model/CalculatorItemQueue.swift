//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Danny on 2/5/24.
//

import Foundation

struct CalculatorItemQueue: CalculateItem {
    private var list: [String] = []
    
    public var count: Int {
        return list.count
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public mutating func enqueue(_ element: String) {
        list.append(element)
    }
    
    public mutating func dequeue() -> String? {
        return list.removeFirst()
    }
    
    public func showQueue() -> [String] {
        return list
    }
    
}
