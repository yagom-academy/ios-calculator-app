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

    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }

    mutating func result() -> Double {
        guard var operationResult = operands.dequeue() else { return Double.nan }
        
        while let nextOperator = operators.dequeue(), let nextOperand = operands.dequeue() {
            operationResult = nextOperator.calculate(operationResult, nextOperand)
        }
        return operationResult
    }
}
