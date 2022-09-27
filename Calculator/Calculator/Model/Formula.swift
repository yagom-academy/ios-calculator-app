//
//  Formula.swift
//  Calculator
//
//  Created by 서현웅 on 2022/09/22.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>.init()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>.init()
    
    mutating func result() -> Double {
        var result: Double = 0.0
        let lhs = operands.dequeue()
        let rhs = operands.dequeue()
        let opt = operators.dequeue()
        
        guard let checkLhs = lhs else { return 9999.9999 }
        guard let checkRhs = rhs else { return 9999.9999 }
        guard let checkOpt = opt else { return 9999.9999 }
        
        while !operands.isEmpty && !operators.isEmpty {
            result = checkOpt.calculate(lhs: checkLhs, rhs: checkRhs)
        }
        return result
    }
}

