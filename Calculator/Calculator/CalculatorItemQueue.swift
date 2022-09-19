//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/19.
//

import Foundation

struct CalculatorItemQueue<T>: CalculatorItem {
    private(set) var input: [T] = []
    private(set) var output: [T] = []
    
    mutating func enQueue(element: T) {
        input.append(element)
    }
    
    mutating func deQueue() throws -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
    
    mutating func clear() {
        input.removeAll()
        output.removeAll()
    }
}
