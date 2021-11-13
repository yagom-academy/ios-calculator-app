//
//  Formula.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() throws -> Double {
        guard let firstOperand = try operands.dequeue() else {
            throw QueueError.operandQueueIsEmpty
        }
        
        var currentValue: Double = firstOperand
        
        while !operands.isEmpty {
            guard let currentOperator = try operators.dequeue() else {
                throw QueueError.operatorQueueIsEmpty
            }
            guard let currentOperand = try operands.dequeue() else {
                throw QueueError.operandQueueIsEmpty
            }
            do {
            currentValue = try currentOperator.calculate(lhs: currentValue, rhs: currentOperand)
            } catch let error {
                throw error
            }
        }
        
        guard operators.isEmpty else {
            throw OperationError.invalidFormula
        }
        
        return currentValue
    }
}
