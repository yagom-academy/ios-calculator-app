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
    let defaultValue: Double = 0
    
    mutating func result() -> Double {
        var valueOfResult: Double = operands.dequeue() ?? defaultValue
        
        while !operands.isEmpty {
            if !operators.isEmpty{
                valueOfResult = operators.dequeue()?.calculate(lhs: valueOfResult, rhs: operands.dequeue() ?? defaultValue) ?? defaultValue
            }
        }
        
        return valueOfResult
    }
}
