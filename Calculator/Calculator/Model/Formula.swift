//
//  Formula.swift
//  Calculator
//
//  Created by 김인호 on 2022/09/22.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        guard var lhs = operands.dequeue() else { return 0 }
        
        while !operands.isEmpty {
            guard let rhs = operands.dequeue() else { return lhs }
            guard let `operator` = operators.dequeue() else { return 0.0 }
            lhs = `operator`.calculate(lhs: lhs, rhs: rhs)
        }
        let result = lhs
        
        return result
    }
}
