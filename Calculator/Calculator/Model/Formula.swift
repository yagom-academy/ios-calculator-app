//
//  Formula.swift
//  Calculator
//
//  Created by Christy, Muri on 2023/01/30.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result: Double = 0
        
        guard let firstOperand = operands.dequeue() else {
            return Double.zero
        }
        
        result = firstOperand
        
        while operands.count > 0 {
            guard let nextOperand = operands.dequeue() else {
                return Double.zero
            }
            guard let operatorSign = operators.dequeue() else {
                return Double.nan
            }
            
            result = operatorSign.calculate(lhs: result, rhs: nextOperand)
        }
        
        return result
    }
}
