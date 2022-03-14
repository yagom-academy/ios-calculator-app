//
//  model.swift
//  Calculator
//
//  Created by Red on 2022/03/15.
//

import Foundation

protocol CalculateItem {
}

enum Operator: CalculateItem {
    case add, subtract, multiply, division
}

extension Double: CalculateItem {
}

struct Queue {
    var queue: [Int: Int] = [:]
    
    mutating func enqueue(with value: Int) {
        self.queue[queue.count + 1] = value
    }
    mutating func returnAllValue() -> [Int] {
        var presentQueue: [Int] = []
        for (_, value) in self.queue {
            presentQueue.append(value)
        }
        return presentQueue
        
    }
}
