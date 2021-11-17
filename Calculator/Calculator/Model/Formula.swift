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
    
    mutating func result() -> Double {
        guard var resultValue = operands.dequeue() else {
            return Double.zero
        }
        while let currentOperator = operators.dequeue(),
              let currentOperand = operands.dequeue() {
            resultValue = currentOperator.calculate(lhs: resultValue, rhs: currentOperand)
        }
        return resultValue
    }
}
