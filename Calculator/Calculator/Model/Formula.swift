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
            throw CalculationItemQueueError.hasNoElement
        }
        
        calculationResult = firstOperand
        
        while !operands.isEmpty && !operators.isEmpty {
            guard let operand = operands.dequeue(), let `operator` = operators.dequeue() else {
                throw CalculationItemQueueError.hasNoElement
            }
            
            let newCalculationResult = try `operator`.calculate(lhs: calculationResult, rhs: operand)
            
            calculationResult = newCalculationResult
        }
        
        return calculationResult
    }
}

