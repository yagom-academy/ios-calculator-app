//
//  Formula.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/14.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            throw CalculatorError.emptyQueue
        }
    
        var isContinue = true
        repeat {
            if let calculateOperator = operators.dequeue(),
               let calculateOperand = operands.dequeue() {
                result = calculateOperator.calculate(
                    lhs: result,
                    rhs: calculateOperand)
            } else {
              isContinue = false
            }
        } while isContinue
        
        return result
    }
}
