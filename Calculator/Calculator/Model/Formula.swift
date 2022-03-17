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
        var middleResult = operands.dequeue()
        while !operands.isEmpty {
            guard let firstOperand = middleResult else { break }
            guard let secondOperand = operands.dequeue() else { break }
            middleResult = operators.dequeue()?.calculate(lhs: firstOperand, rhs: secondOperand)
        }
        guard let result = middleResult else { return 0 }
        return result
    }
}

