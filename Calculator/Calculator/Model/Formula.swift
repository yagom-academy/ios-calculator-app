//
//  Formula.swift
//  Calculator
//
//  Created by 1 on 2021/11/15.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    init(operands: CalculatorItemQueue, operators: CalculatorItemQueue) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() throws -> Double {
        guard let result = operands.dequeue() as? Double else {
            throw CalculatorError.emptyCalculatorItemQueue
        }
        
        return try operators.queue.reduce(result) { (lhs: Double , operation: CalculateItem) in
            guard let operation = operation as? Operator else {
                throw CalculatorError.emptyCalculatorItemQueue
            }
            guard let rhs = operands.dequeue() as? Double else {
                throw CalculatorError.emptyCalculatorItemQueue
            }
            return try operation.calculate(lhs: lhs, rhs: rhs)
        }
    }
}
