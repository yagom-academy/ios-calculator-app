//
//  Formula.swift
//  Calculator
//
//  Created by 재재 on 2022/05/25.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Character>
    
    mutating func result() throws -> Double {
        guard var result: Double = operands.dequeue() else { throw FormulaError.noOperandsInQueue }
        while operators.isEmpty == false {
            guard let eachOperator = operators.dequeue()
            else {
                throw FormulaError.emptyError
            }
            guard let operandsItem = operands.dequeue()
            else {
                throw FormulaError.emptyError
            }
            let operatorsItem = OperatorItem(rawValue: eachOperator)
            result = (operatorsItem?.calculate(lhs: result, rhs: operandsItem))!
        }
        return result
    }
}

enum FormulaError: Error {
    case emptyError
    case noOperandsInQueue
}
