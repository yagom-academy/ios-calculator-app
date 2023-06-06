//
//  Formula.swift
//  Calculator
//
//  Created by MARY on 2023/06/03.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard operators.size > 1,
              operators.size + 1 == operands.size else {
            throw FormulaErrors.invalidFormula
        }
        guard var returnValue = operands.dequeue() else {
            throw FormulaErrors.invalidOperators
        }
        
        while operators.isEmpty == false {
            guard let `operator` = operators.dequeue() else {
                throw FormulaErrors.invalidOperators
            }
            guard let rhs = operands.dequeue() else {
                throw FormulaErrors.invalidOperands
            }
            
            returnValue = try `operator`.calculate(lhs: returnValue, rhs: rhs)
        }
        
        return returnValue
    }
}
