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
    
    init(){
        operands = CalculatorItemQueue()
        operators = CalculatorItemQueue()
    }
    
    mutating func result() throws -> Double {
        guard let firstOperand = try operands.dequeue() else {
            throw QueueError.isEmpty
        }
        
        var currentValue: Double = firstOperand
        
        while operands.isEmpty == false {
            guard let currentOperator = try operators.dequeue() else {
                throw QueueError.isEmpty
            }
            guard let currentOperand = try operands.dequeue() else {
                throw QueueError.isEmpty
            }
            currentValue = currentOperator.calculate(lhs: currentValue, rhs: currentOperand)
        }
        
        return currentValue
    }
}
