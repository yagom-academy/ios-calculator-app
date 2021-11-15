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
        guard var result = operands.dequeue() else {
            return 0.0
        }
        
        while !operands.isEmpty() {
            guard let `operator` = operators.dequeue() else {
                return 0.0
            }
            guard let operand = operands.dequeue() else {
                return 0.0
            }
            
            if `operator` == .divide && operand == 0.0 {
                throw FormulaError.NaN
            }
            
            result = `operator`.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}
