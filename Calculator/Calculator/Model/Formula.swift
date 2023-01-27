//
//  Formula.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/27.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    mutating func result() -> Double {
        let lhs = operands.dequeue()
        let rhs = operands.dequeue()
        return 0.0
    }
}
