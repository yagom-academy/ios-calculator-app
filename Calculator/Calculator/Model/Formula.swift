//
//  Formula.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/16.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        let operand = try operands.deQueueFirstElement()
        var result = operand
        
        while !operators.isEmpty {
            let `operator` = try operators.deQueueFirstElement()
            let rhs = try operands.deQueueFirstElement()
            result = try `operator`.calculate(lhs: result, rhs: rhs)
        }
        return result
    }
}
