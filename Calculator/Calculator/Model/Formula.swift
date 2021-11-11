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
    
    init() {
        self.operands = CalculatorItemQueue<Double>()
        self.operators = CalculatorItemQueue<Operator>()
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
            do {
            currentValue = try currentOperator.calculate(lhs: currentValue, rhs: currentOperand)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        return currentValue
    }
}
