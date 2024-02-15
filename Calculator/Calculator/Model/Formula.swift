//
//  Formula.swift
//  Calculator
//
//  Created by Danny on 2/11/24.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        var valueOfResult: Double = operands.dequeue() ?? Constant.zero
        
        while operands.isEmpty == false {
            if operators.isEmpty == false {
                var elementOfOperators = operators.dequeue()
                valueOfResult = elementOfOperators?.calculate(lhs: valueOfResult, rhs: operands.dequeue() ?? Constant.zero) ?? Constant.zero
            } else {
                throw CalculatorError.overTheOperands
            }
        }
        
        return valueOfResult
    }
}
