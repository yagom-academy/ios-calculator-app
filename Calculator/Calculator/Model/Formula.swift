//
//  Formula.swift
//  Calculator
//
//  Created by yeton on 2022/05/19.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var formulaResult = operands.dequeue() else {
            return 0.0
        }
        
        while operators.queue.count != 0 {
            if let operand = operands.dequeue(),
                let `operator` = operators.dequeue() {
                formulaResult = try `operator`.calculate(lhs: formulaResult, rhs: operand)
            }
        }
        return formulaResult
    }
}
