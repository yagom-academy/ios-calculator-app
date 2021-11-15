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
        while let _operator = operators.dequeue(),
              let operand = operands.dequeue() {
            resultValue = _operator.calculate(lhs: resultValue, rhs: operand)
        }
        return resultValue
    }
}
