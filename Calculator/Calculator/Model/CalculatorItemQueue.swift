//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Baem on 2022/09/20.
//

struct CalculatorItemQueue<T>: CalculatorItem {
    var queue: [T] = []
    
    mutating func addQueue(_ element: T) {
        queue.append(element)
    }
    
}
