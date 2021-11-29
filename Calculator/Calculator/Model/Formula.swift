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
        //        guard var result = operands.dequeue() as? Double else {
        //            return Double.nan
        //        }
        //
        //        for _ in 1...operators.itemCount {
        //            let rhs = operands.dequeue() as! Double
        //            let operation = operators.dequeue() as! Operator
        //            result = operation.calculate(lhs: result, rhs: rhs)
        //        }
        //        return result
        //    }
    }
}
