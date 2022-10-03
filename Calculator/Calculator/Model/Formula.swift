//
//  Formula.swift
//  Calculator
//
//  Created by 임지연 on 2022/10/03.
//

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
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
