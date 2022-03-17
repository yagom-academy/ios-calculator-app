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
    
    mutating func result() throws -> Double {
        var middleResult = operands.dequeue()
        
        while !operands.isEmpty {
            guard let firstOperand = middleResult else {
                throw CalculationError.unknownError }
            
            guard let secondOperand = operands.dequeue() else {
                throw CalculationError.unknownError }
            
            middleResult = operators.dequeue()?.calculate(lhs: firstOperand, rhs: secondOperand)
        }
        
        guard let result = middleResult else {
            throw CalculationError.unknownError }
        
        return result
    }
}

