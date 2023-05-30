//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by redmango1446 on 2023/05/30.
//

struct CalculatorItemQueue {
    var calculatorQueue: [String] = []
    
    mutating func enqueue(_ element: String) {
        calculatorQueue.append(element)
    }
    
}
