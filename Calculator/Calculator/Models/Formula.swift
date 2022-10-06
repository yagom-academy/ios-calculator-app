//
//  Formula.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/22.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var result = operands.pop() else {
            throw CalculatorError.queueIsEmpty
        }
        
        while !operands.isEmpty {
            guard let currentOperator = operators.pop(),
                  let operand = operands.pop() else {
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
