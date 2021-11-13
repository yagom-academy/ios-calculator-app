//
//  Formula.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/12.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard var combinedResult = operands.dequeue() else { return 0.0 }

        while let nextOperator = operators.dequeue(),
              let nextOperand = operands.dequeue() {
            combinedResult = nextOperator.calculate(lhs: combinedResult, rhs: nextOperand)
            }
        
        return combinedResult
    }
}
