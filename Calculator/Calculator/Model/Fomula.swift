//
//  Fomula.swift
//  Calculator
//
//  Created by 김태훈 on 2022/03/28.
//

import Foundation

struct Fomula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Result<Double, CalculatorError> {
        guard var result = operands.dequeue() else {
            return .failure(.nonOperand)
        }
        
        while operands.isEmpty == false || operators.isEmpty == false {
            guard let operand = operands.dequeue() else {
                return .failure(.nonOperand)
            }
            guard let `operator` = operators.dequeue() else {
                return .failure(.nonOperator)
            }
            
            if `operator` == Operator.divide && operand == Double.zero {
                return .failure(.divisionByZero)
            }
            
            result = `operator`.caculate(lhs: result, rhs: operand)
        }
        return .success(result)
    }
}
