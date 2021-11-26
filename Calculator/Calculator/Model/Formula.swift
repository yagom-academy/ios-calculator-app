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
    
    mutating func result() throws -> Double {
        guard let firstOperand = operands.dequeue() else {
            throw QueueError.emptyOperandItem
        }
        
        var result: Double = firstOperand
        
        while !operators.isEmpty {
            guard let `operator` = operators.dequeue() else {
                throw QueueError.emptyOperatorItem
            }
            
            guard let operand = operands.dequeue() else {
                throw QueueError.emptyOperandItem
            }
            
            result = try `operator`.calculate(lhs: result, rhs: operand)
        }
        
        guard operands.isEmpty else {
            throw OperationError.invalidFormula
        }
        
        return result
    }
}
