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
        var lhs = operands.dequeue() ?? .nan
        while let rhs = operands.dequeue(), let oneOperator = operators.dequeue() {
            lhs = oneOperator.calculate(lhs: lhs, rhs: rhs)
            }
        return lhs
    }
}
