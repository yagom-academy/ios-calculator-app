//
//  Formula.swift
//  Calculator
//
//  Created by Prism, Hamzzi on 2/16/24.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard operands.count == operators.count + 1,
              var result = operands.dequeue() else {
            throw CalculateError.invalidFormula
        }
        
        while !operators.isEmpty {
            guard let calculatorOperator = operators.dequeue(),
                  let calculatorOperand = operands.dequeue() else {
                throw CalculateError.invalidFormula
            }
            
            result = try calculatorOperator.calculate(lhs: result, rhs: calculatorOperand)
        }
        
        return result
    }
}
