//
//  Formula.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/14.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        var resultValue = try operands.dequeue()
        
        while operators.isNotEmpty {
            let currentOperator = try operators.dequeue()
            let currentOperand = try operands.dequeue()
            resultValue = currentOperator.calculate(lhs: resultValue, rhs: currentOperand)
        }
        return resultValue
    }
}
