//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/16.
//

import Foundation

struct CalculatorItemQueue {
    private var calculatorItemQueue = Array<Int>()

    public var count: Int {
        return calculatorItemQueue.count
    }
    
    public var isEmpty: Bool {
        return calculatorItemQueue.isEmpty
    }
    
    public mutating func enqueue(_ element: Int) {
        calculatorItemQueue.append(element)
//        calculatorItemQueue.insert(element, at: 3)
    }
    
    public mutating func dequeue() -> Int? {
        return isEmpty ? nil : calculatorItemQueue.removeFirst()
    }
    
    public mutating func clear() {
        calculatorItemQueue.removeAll()
    }
}
