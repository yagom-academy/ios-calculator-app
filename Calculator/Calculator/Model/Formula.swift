//
//  Formula.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/12.
//

import Foundation

struct Formula {
    enum FormulaError: Error {
        case NaN
    }
    
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    func result() throws -> Double {
        var result: Double = 0.0
        guard let initialValue = operands.dequeue() else {
            return 0.0
        }
        
        result = result + initialValue
        
        while operands.queue.first != nil {
            guard let currentOperator = operators.dequeue() else {
                return 0.0
            }
            guard let calculatingOperand = operands.dequeue() else {
                return 0.0
            }
            
            if currentOperator == .divide && calculatingOperand == 0.0 {
                throw FormulaError.NaN
            }
            
            result = currentOperator.calculate(lhs: result, rhs: calculatingOperand)
        }
        
        return result
    }
}
