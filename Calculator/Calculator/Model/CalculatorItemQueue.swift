//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Serena on 2023/05/29.
//

struct CalculatorItemQueue {
    private(set) var queue: [Int] = []
    
    mutating func enqueue(element: Int) {
        queue.append(element)
    }
}
