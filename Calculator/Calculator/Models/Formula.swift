//
//  Formula.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/22.
//

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    mutating func result() throws -> Double {
        guard var result = operands.pop() as? Double else {
            throw CalculatorError.queueIsEmpty
        }
        
        while !operands.isEmpty {
            guard let currentOperator = operators.pop() as? Operator else {
                throw CalculatorError.queueIsEmpty
            }
            
            guard let operand = operands.pop() as? Double else {
                throw CalculatorError.queueIsEmpty
            }
            
            if currentOperator == Operator.divide,
               operand == 0.0 {
                throw CalculatorError.divisionByZero
            }            
            
            result = currentOperator.calculate(result, operand)
        }
        
        return result
    }
}
