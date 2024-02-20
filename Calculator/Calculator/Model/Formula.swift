//
//  Formula.swift
//  Calculator
//
//  Created by Danny on 2/20/24.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard operands.size == operators.size + 1 else {
            throw CalculatorError.unexpected
        }
        
        guard var valueOfResult = operands.pop() else {
            throw CalculatorError.unexpected
        }
        
        while operands.isEmpty == false {
            if operators.isEmpty == false {
                guard let elementOfOperators = operators.pop() else {
                    throw CalculatorError.unexpected
                }
                
                guard let elementOfOperands = operands.pop() else {
                    throw CalculatorError.unexpected
                }
                
                if elementOfOperators == Operator.divide && elementOfOperands == 0 {
                    throw CalculatorError.divideByZero
                }
                
                valueOfResult = elementOfOperators.calculate(lhs: valueOfResult, rhs: elementOfOperands)
            }
        }
        
        return valueOfResult
    }
}
