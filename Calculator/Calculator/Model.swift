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
    var queue: [Int: CalculateItem] = [:]
    var head: Int = 1
    
    mutating func enqueue(with value: CalculateItem) {
        self.queue[queue.count + 1] = value
    }
    
    mutating func dequeue() -> CalculateItem {
        let value = self.queue[head] ?? 0.0
        head += 1
        return value
    }
    mutating func returnAllValue() -> [CalculateItem] {
        var presentQueue: [CalculateItem] = []
        for (_, value) in self.queue {
            presentQueue.append(value)
        }
        return presentQueue
        
    }
}
