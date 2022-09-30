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
    
    mutating func result() throws -> Double {
        let result = try operands.mergedQueue.reduce(0.0) { accumlatingResult, nextOperand in
            guard let nowOperator = operators.popFirst() as? Operator else {
                throw CalculateError.invalidOperator
            }
            guard let operands = nextOperand as? Double else {
                throw CalculateError.invalidOperand
            }
            
            return nowOperator.calculate(lhs: accumlatingResult, rhs: operands)
        }
        return result
    }
}
