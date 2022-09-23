//
//  Formula.swift
//  Calculator
//
//  Created by 이정민 on 2022/09/23.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue = CalculatorItemQueue<Operator>()
    
    func result() -> Double {
        return 1.1
    }
}
