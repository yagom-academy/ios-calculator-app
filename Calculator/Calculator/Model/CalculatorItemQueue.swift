//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/18.
//

import Foundation

struct CalculatorItemQueue {
    private(set) var queue: [Double] = []
    
    mutating func enqueue(_ number: Double) {
        queue.append(number)
    }
    
    mutating func dequeue() -> Double? {
        return queue.removeFirst()
    }
}
