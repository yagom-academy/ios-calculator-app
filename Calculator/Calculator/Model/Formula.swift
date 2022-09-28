//
//  Formula.swift
//  Calculator

import Foundation

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    init(operrands: CalculatorItemQueue, operators: CalculatorItemQueue) {
        self.operands = operrands
        self.operators = operators
    }
    
    mutating func result() -> Double {
        let result = operands.mergedQueue.reduce(0.0) {
            guard let nowOperator = operators.popFirst() as? Operator else {
                return 0
            }
            guard let operands = $1 as? Double else {
                return 0
            }
            
            return nowOperator.calculate(lhs: $0, rhs: operands)
        }
        return result
    }
}
