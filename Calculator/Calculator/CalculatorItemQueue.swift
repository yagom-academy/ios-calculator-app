//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Gundy on 2022/09/19.
//

struct CalculatorItemQueue<T>: CalculateItem {
    var data: [T] = []
    
    init() {}
    
    mutating func enqueue(_ element: T) {
        data.append(element)
    }
}
