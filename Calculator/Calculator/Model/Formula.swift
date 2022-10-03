//
//  Formula.swift
//  Calculator

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        let result = try operands.mergedQueue.reduce(0.0) { accumulatingResult, nextOperand in
            guard let nowOperator = operators.dequeue() else {
                throw CalculatorError.shortOperator
            }
            return try nowOperator.calculate(lhs: accumulatingResult, rhs: operands)
        }
        return result
    }
}
