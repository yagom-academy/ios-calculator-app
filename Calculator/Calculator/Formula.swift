//
//  Formula.swift
//  Calculator
//
//  Created by Christy Lee on 2023/01/30.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    mutating func result() -> Double {
        return Double.nan
    }
}
