//
//  Formula.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/31.
//

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    mutating func result() throws -> Double {
        var result = Double.zero
        var operatorType: Operator = .add

        while true {
            do {
                guard let rhs = try operands.dequeue() as? Double else {
                    throw CalculatorError.invalidInput
                }
                let lhs = result
                result = try operatorType.calculate(lhs: lhs, rhs: rhs)
                guard let newOperator = try operators.dequeue() as? Operator else {
                    throw CalculatorError.invalidOperator
                }
                operatorType = newOperator
            } catch CalculatorError.indexOutOfRange {
                break
            }
        }
        return result
    }
}
