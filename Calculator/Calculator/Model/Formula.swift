//
//  Formula.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/14.
//

import Foundation

struct Formula {
    let operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    let operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    func result() -> Double {
        return 0.0
    }
}
