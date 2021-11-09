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
        guard let result = Operator(rawValue: operators.deQueue())?.calculate(lhs: operands.deQueue(), rhs: operands.deQueue()) else {
            return 1.0
        }
        
        return result
    }
}
