//
//  Formula.swift
//  Calculator
//
//  Created by 박종화 on 2023/06/02.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()

    mutating func result() -> Double {
        
    }
}
