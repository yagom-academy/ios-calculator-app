//
//  Formula.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/09.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Character>
    
    mutating func result() throws -> Double {
        var result = try operands.deQueue()
        
        while !operators.isEmpty {
            guard let unitResult = try Operator(rawValue: try operators.deQueue())?
                    .calculate(lhs: result, rhs: try operands.deQueue()) else {
                throw CalculateError.calculateFailed
            }
            result = unitResult
        }
        return result
    }
}
