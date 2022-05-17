//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Baek on 2022/05/17.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    var formulaQueue = Array<T>()
    
    var isEmpty: Bool {
        return formulaQueue.isEmpty
    }
    
    var peek: T? {
        return formulaQueue.first
    }
    
    mutating func enQueue(_ element: T) -> Bool {
        formulaQueue.append(element)
    }
    
    mutating func deQueue() -> T? {
        return isEmpty ? nil : formulaQueue.removeFirst()
    }
}
