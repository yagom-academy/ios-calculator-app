//
//  Formula.swift
//  Calculator
//
//  Created by 임지성 on 2021/11/11.
//

import Foundation

struct Formula {
    let operators: CalculatorItemQueue<Operator>
    let operands: CalculatorItemQueue<Double>
    
    init(operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>(), operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()) {
        self.operators = operators
        self.operands = operands
    }
    
    func result() -> Double {
        return 0.0
    }
}
