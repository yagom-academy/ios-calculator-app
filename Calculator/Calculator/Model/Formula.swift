//
//  Formula.swift
//  Calculator
//
//  Created by 임지연 on 2022/10/03.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() throws -> Double? {
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
