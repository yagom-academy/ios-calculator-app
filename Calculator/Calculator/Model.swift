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

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "÷"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return self.add(lhs: lhs, rhs: rhs)
        case .subtract:
            return self.subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return self.divided(lhs: lhs, rhs: rhs)
        case .multiply:
            return self.mutiply(lhs: lhs, rhs: rhs)
        }
    }
    
    func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    func divided(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    
    func mutiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
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
