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
    
    mutating func result() -> Double {
        var valueOfResult: Double = operands.dequeue() ?? Constant.zero
        
        while operands.isEmpty == false {
            if operators.isEmpty == false {
                valueOfResult = operators.dequeue()?.calculate(lhs: valueOfResult, rhs: operands.dequeue() ?? Constant.zero) ?? Constant.zero
            }
        }
        
        return valueOfResult
    }
}
