//
//  Formula.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/14.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        var result = try operands.dequeue()
        repeat {
            let calculateOperator = try operators.dequeue()
            let calculateOperand = try operands.dequeue()
            result = calculateOperator.calculate(
                lhs: result,
                rhs: calculateOperand)
        } while !operators.outbox.isEmpty
        return result
    }
}
