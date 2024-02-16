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
        guard operands.count == operators.count + 1 else {
            throw CalculatorError.unExpectedError
        }
        
        guard var valueOfResult = operands.dequeue() else {
            throw CalculatorError.unExpectedError
        }
        
        while operands.isEmpty == false {
            if operators.isEmpty == false {
                guard let elementOfOperators = operators.dequeue() else {
                    throw CalculatorError.unExpectedError
                }
                try valueOfResult = elementOfOperators.calculate(lhs: valueOfResult, rhs: operands.dequeue() ?? Constant.zero)
            }
        }
        
        return valueOfResult
    }
}
