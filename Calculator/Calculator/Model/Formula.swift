//
//  Formula.swift
//  Calculator
//
//  Created by MARY on 2023/06/03.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var accumulatedValue = operands.dequeue() else {
            throw FormulaErrors.noValueInQueue
        }
        
        while let `operator` = operators.dequeue(),
              let rhs = operands.dequeue() {
            accumulatedValue = try `operator`.calculate(lhs: accumulatedValue, rhs: rhs)
        }
        
        return accumulatedValue
    }
}
