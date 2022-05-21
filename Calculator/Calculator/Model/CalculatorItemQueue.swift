//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/18.
//

import Foundation

struct CalculatorItemQueue {
    // MARK: - Properties
    
    private(set) var queue: [Double] = []
    
    // MARK: - Action
    
    mutating func enqueue(_ number: Double) {
        queue.append(number)
    }
    
    mutating func dequeue() -> Double? {
        return queue.isEmpty ? nil : queue.removeFirst()
    }
}
