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
        var result = 0.0
        var operatorType: Operator = .add

        while true {
            do {
                guard let rhs = try operands.dequeue() as? Double else {
                    break
                }
                let lhs = result
                result = try operatorType.calculate(lhs: lhs, rhs: rhs)
                guard let newOperator = try operators.dequeue() as? String,
                      let operatorEnum = Operator(rawValue: Character(newOperator)) else {
                    break
                }
                operatorType = operatorEnum
            } catch CalculatorError.indexOutOfRange {
                break
            }
        }
        return result
    }
}
