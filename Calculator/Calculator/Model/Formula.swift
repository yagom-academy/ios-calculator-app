//
//  Formula.swift
//  Calculator
//
//  Created by Dasan on 2023/06/02.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    mutating func result() throws -> Double {
        guard var accumulatedValue = operands.dequeue() else {
            throw CalculatorError.invalidOperation
        }
        
        while let rightValue = operands.dequeue(),
              let currentOperator = operators.dequeue() {
            accumulatedValue = try currentOperator.calculate(lhs: accumulatedValue, rhs: rightValue)
        }
    
        return accumulatedValue
    }
}
