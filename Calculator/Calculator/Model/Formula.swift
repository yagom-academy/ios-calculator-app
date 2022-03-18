//
//  Formula.swift
//  Calculator
//
//  Created by Red on 2022/03/18.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        var lhs = operands.dequeue() ?? 0.0
        while operators.isEmpty == false {
            let rhs = operands.dequeue() ?? 0.0
            let oneOperator = operators.dequeue() ?? Operator.add
            lhs = oneOperator.calculate(lhs: lhs, rhs: rhs)
            }
        return lhs
    }
}
