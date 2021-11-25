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
        guard let result = operands.dequeue() else {
            throw CalculatorError.emptyQueue
        }
        
        return recursiveCalculate(result: result)
    }
    
    private mutating func recursiveCalculate(result: Double) -> Double {
        if let calculateOperator = operators.dequeue(),
          let calculateOperand = operands.dequeue() {
            let calculatedResult = calculateOperator.calculate(lhs: result, rhs: calculateOperand)
            
            return recursiveCalculate(result: calculatedResult)
        } else {
            return result
        }
    }
    
}
