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
        guard var middleResult = operands.dequeue() else {
            return .nan
        }
        
        while let operand = operands.dequeue(), let onceOperator = operators.dequeue() {
            middleResult = onceOperator.calculate(lhs: middleResult, rhs: operand)
        }
        
        return middleResult
    }
}

