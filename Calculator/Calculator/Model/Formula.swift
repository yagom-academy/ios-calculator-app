//
//  Formula.swift
//  Calculator
//
//  Created by 이예은 on 2022/05/19.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        guard var previousResult = operands.dequeue() else {
            return 0.0
        }
    }
}
