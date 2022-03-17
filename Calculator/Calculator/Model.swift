//
//  model.swift
//  Calculator
//
//  Created by Red on 2022/03/15.
//

import Foundation

protocol CalculateItem {
    // empty
}

enum Operator: CalculateItem {
    case add, subtract, multiply, division
    
    func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
}

extension Double: CalculateItem {
}

struct CalculatorItemQueue {
    private(set) var queue: [Int: CalculateItem] = [:]
    private(set) var head: Int = 0
    private(set) var tail: Int = 0
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(with data: CalculateItem) {
        queue[tail] = data
        tail += 1
    }
    
    mutating func dequeue() -> CalculateItem? {
        if isEmpty {
            return nil
        }
        let value = queue[head]
        queue[head] = nil
        head += 1
        return value
    }
    
    mutating func reset() {
        queue = [:]
        head = 0
        tail = 0
    }
}
