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
    
    mutating func result() -> Double {
        
        var result = operands.deQueue()
        
        while !operators.isEmpty {
            guard let unitResult = Operator(rawValue: operators.deQueue())?.calculate(lhs: result, rhs: operands.deQueue()) else {
                return 1.0
            }
            result = unitResult
        }
        return result
    }
}
