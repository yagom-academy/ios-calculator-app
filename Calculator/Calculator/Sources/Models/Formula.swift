//
//  Formula.swift
//  Calculator
//
//  Created by 재재, Kay on 2022/05/25.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<OperatorItem>
    
    mutating func result() throws -> Double {
        guard var result: Double = operands.dequeue() else {
            throw FormulaError.noOperandsInQueue
        }
        while operators.isEmpty == false {
            guard let eachOperator = operators.dequeue() else {
                throw FormulaError.noOperatorsInQueue
            }
            guard let operandsItem = operands.dequeue() else {
                throw FormulaError.noOperandsInQueue
            }
            result = try eachOperator.calculate(lhs: result, rhs: operandsItem)
        }
        return result
    }
}

enum FormulaError: Error {
    case noOperatorsInQueue
    case noOperandsInQueue
}
