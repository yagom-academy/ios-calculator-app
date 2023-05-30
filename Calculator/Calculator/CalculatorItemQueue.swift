//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by MARY on 2023/05/30.
//

struct CalculatorItemQueue {
    var itemQueue: [String] = []
    
    mutating func enqueue(_ element: String) {
        itemQueue.append(element)
    }
}
