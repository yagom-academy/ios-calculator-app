//
//  Formula.swift
//  Calculator
//
//  Created by 천승현 on 2023/01/27.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<String>()
    
    func result() -> Double {
        return 0.0
    }
}
