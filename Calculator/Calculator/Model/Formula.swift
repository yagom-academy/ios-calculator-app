//
//  Formula.swift
//  Calculator
//
//  Created by Serena on 2023/06/05.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    mutating func result() throws -> Double {
        var result: Double = 0.0
        var lhs: Double?

        while !operators.isEmpty {
            (lhs == nil) ? (lhs = operands.dequeue()) : (lhs = result)

            guard let lhs,
                  let rhs = operands.dequeue(),
                  let calculationOperator = operators.dequeue() else {
                throw CalculateError.invalidDequeue
            }

            result = calculationOperator.calculate(lhs: lhs, rhs: rhs)

            guard result != Double.nan || result != Double.infinity else {
                throw CalculateError.dividedByZero
            }
        }

        return result
    }
}
