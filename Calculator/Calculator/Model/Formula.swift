//
//  Formula.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    mutating func result() -> Double {
        guard var calculatedResult = operands.dequeue() else { return Double.nan }
        
        while let nextOperator = operators.dequeue(), let nextOperand = operands.dequeue() {
            calculatedResult = nextOperator.calculate(calculatedResult, nextOperand)
        }
        return calculatedResult
    }
}
