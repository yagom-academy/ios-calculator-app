//
//  Formula.swift
//  Calculator
//
//  Created by 권나영 on 2021/11/14.
//

import Foundation

struct Formula {
    var operands: CalculateItemQueue<Double>
    var operators: CalculateItemQueue<Operator>
    
    mutating func result() throws -> Double {
        var result = Double()
        
        let lhs = try operands.dequeue()
        let rhs = try operands.dequeue()
        let `operator` = try operators.dequeue()
        result = try `operator`.calculate(lhs: lhs, rhs: rhs)
        
        while operands.isEmpty == false {
            let rhs = try operands.dequeue()
            let `operator` = try operators.dequeue()
            result = try `operator`.calculate(lhs: result, rhs: rhs)
        }
        return result
    }
}
