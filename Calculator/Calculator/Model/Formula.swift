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
    
    mutating func result() -> Double {
        let calculateCount = operators.testableQueue.count
        var result = operands.dequeue() as! Double
        for _ in 1...calculateCount {
            let rhs: Double = operands.dequeue() as! Double
            let operation: Operator = operators.dequeue() as! Operator
        result = operation.calculate(lhs: result, rhs: rhs)
        }
        return result
    }
}
