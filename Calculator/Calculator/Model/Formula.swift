//
//  Formula.swift
//  Calculator
//
//  Created by karen, Mary.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var accumulatedValue = operands.dequeue() else { return 0 }

        while let `operator` = operators.dequeue(),
              let rhs = operands.dequeue() {
            accumulatedValue = try `operator`.calculate(lhs: accumulatedValue, rhs: rhs)
        }
        
        return accumulatedValue
    }
}

