//
//  Formula.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/14.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    func result() -> Double {
        return 0.0
    }
}
