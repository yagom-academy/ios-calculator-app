//
//  Formula.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    init() {
        self.operands = CalculatorItemQueue<Double>()
        self.operators = CalculatorItemQueue<Operator>()
    }

    mutating func result() -> Double {
        return 1.1
    }
}
