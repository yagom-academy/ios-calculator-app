//
//  Formula.swift
//  Calculator
//
//  Created by Sunwoo on 2021/11/16.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        guard let lhsOperand = operands.dequeue() else {
            throw CalculatorQueueError.NoElement
        }
        
        var resultOfCaculate = lhsOperand
        
        while operands.countAllItem() != 0 {
            guard let nextOperand = operands.dequeue() else {
                throw CalculatorQueueError.NoElement
            }
            
            guard let `operator` = operators.dequeue() else {
                throw CalculatorQueueError.NoElement
            }
            
            resultOfCaculate = try `operator`.calculate(lhs: resultOfCaculate, rhs: nextOperand)
        }
        
        return resultOfCaculate
    }
}
