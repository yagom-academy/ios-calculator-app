//
//  Formula.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        var middleResult = operands.dequeue() ?? .nan
        
        while !operands.isEmpty {
            guard let operand = operands.dequeue() else {
                return .nan }
            
            guard let onceOperator = operators.dequeue() else {
                return .nan
            }
            middleResult = onceOperator.calculate(lhs: middleResult, rhs: operand)
        }
        return middleResult
    }
}

