//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/25.
//

import Foundation

protocol Calculate {
}

struct CalculatorItemQueue<T>: Calculate {
    
    public var queue: [T] = []
        
    public var count: Int {
        return queue.count
    }
        
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueueItem(_ element: T) {
        queue.append(element)
    }
        
    public mutating func dequeueItem() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}


var myQueue = CalculatorItemQueue<Int>()

