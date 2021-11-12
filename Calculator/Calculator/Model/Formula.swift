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
        
        while operands.items.count > 0 && operators.items.count > 0 {
            guard let nextOperand = operands.dequeue() else {
                throw QueueError.queueIsEmpty
            }
            
            guard let nextOperator = operators.dequeue() else {
                throw QueueError.queueIsEmpty
            }
            
            let nextCalculationResult = nextOperator.calculate(lhs: calculationResult, rhs: nextOperand)
            
            if nextCalculationResult.isNaN {
                return .nan
            }
            
            calculationResult = nextCalculationResult
        }
        
        return calculationResult
    }
}

