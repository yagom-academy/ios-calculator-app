//
//  Formula.swift
//  Calculator
//
//  Created by 예거 on 2021/11/15.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard var partialResult: Double = operands.dequeue() else {
            return Double.nan
        }

        while let nextOperator = operators.dequeue(),
              let nextOperand = operands.dequeue() {
            partialResult = nextOperator.calculate(partialResult, nextOperand)
        }
        
        return partialResult
    }
}
