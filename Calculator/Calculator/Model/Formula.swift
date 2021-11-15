//
//  Formula.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/11.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        var calculationResult: Double = 0.0
        
        guard let firstOperand = operands.dequeue() else {
            throw QueueError.queueIsEmpty
        }
        
        calculationResult = firstOperand
        
        while operands.hasOneOrMoreItems && operators.hasOneOrMoreItems {
            guard let operand = operands.dequeue() else {
                throw QueueError.queueIsEmpty
            }
            
            guard let `operator` = operators.dequeue() else {
                throw QueueError.queueIsEmpty
            }
            
            let newCalculationResult = try `operator`.calculate(lhs: calculationResult, rhs: operand)
            
            calculationResult = newCalculationResult
        }
        
        return calculationResult
    }
}

