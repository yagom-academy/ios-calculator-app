//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Wonbi on 2022/09/19.
//

import Foundation

struct CalculatorItemQueue {
    var input: [CalculateItem] = []
    var output: [CalculateItem] = []
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    var count: Int {
        input.count + output.count
    }
    
    mutating func enqueue(_ element: CalculateItem) {
        input.append(element)
    }
}
