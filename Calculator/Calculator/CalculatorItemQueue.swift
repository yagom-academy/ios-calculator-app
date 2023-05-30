//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by redmango1446 on 2023/05/30.
//

struct CalculatorItemQueue {
    var calculatorQueue: [String] = []
    var isEmpty: Bool {
        return calculatorQueue.isEmpty
    }
    
    mutating func enqueue(_ element: String) {
        calculatorQueue.append(element)
    }
    
}
