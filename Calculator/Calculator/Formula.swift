//
//  Formula.swift
//  Calculator
//
//  Created by Baek on 2022/05/20.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result = operands.dequeue() ?? 0
        
        while let operands = operands.dequeue(), let operators = operators.dequeue() {
            result = operators.calculate(lhs: result, rhs: operands)
        }
        return result
    }
}
