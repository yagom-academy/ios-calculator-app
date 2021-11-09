//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/09.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<T>: CalculateItem {
    var queue: [T] = []
    
    mutating func enQueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func deQueue() -> T? {
        if queue.isEmpty {
            return nil
        }
        return queue.removeFirst()
    }
}
