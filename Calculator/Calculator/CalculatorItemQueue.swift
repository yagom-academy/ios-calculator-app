//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/25.
//

import Foundation

protocol CalculateItem {
}

struct CalculatorItemQueue<T>: CalculateItem {
    
    var queue: [T] = []
    var head: Int = 0
    
    var count: Int {
        return queue.count
    }
        
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueueItem(_ element: T) {
        queue.append(element)
    }
        
    mutating func dequeueItem() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}


var myQueue = CalculatorItemQueue<Int>()

