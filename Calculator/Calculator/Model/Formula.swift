//
//  Formula.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/18.
//

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    func result() throws -> Double {
        guard var result = operands.dequeue() as? Double else {
            throw CalculatorError.unexpectedOperand
        }
        
        try operators
            .forEach {
                guard let `operator` = $0.data as? Operator else {
                    throw CalculatorError.unexpectedOperator
                }
                guard let rhs = operands.dequeue() as? Double else {
                    throw CalculatorError.unexpectedOperand
                }
                result = try `operator`.calculate(lhs: result, rhs: rhs)
            }
        
        return result
    }
}
