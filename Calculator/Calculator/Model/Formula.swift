//
//  Formula.swift
//  Calculator
//
//  Created by 박종화 on 2023/06/02.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()

    mutating func result() throws -> Double {
        var result: Double = 0.0
        guard let lhs: Double = operands.dequeue() else {
            throw CalculationErrors.emptyStack }
        
        while let rhs = operands.dequeue(),
              let `operator` = operators.dequeue() {
            let calculatedValue = `operator`.calculate(lhs: lhs, rhs: rhs)
            result = calculatedValue
        }
        
        return result
    }
}
