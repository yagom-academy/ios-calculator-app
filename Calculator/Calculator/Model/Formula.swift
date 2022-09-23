//
//  Formula.swift
//  Calculator
//
//  Created by 서현웅 on 2022/09/22.
//

import Foundation

struct Formula {
    let operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>.init()
    let operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>.init()
    
    func result() -> Double {
        return 0
    }
}
