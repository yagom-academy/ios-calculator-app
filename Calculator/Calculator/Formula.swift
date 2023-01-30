//
//  Formula.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/26.
//

import Foundation

struct Formula {
    
    var operators: CalculatorItemQueue<Operator>
    var operands: CalculatorItemQueue<Double>
    
    mutating func result() -> Double {
        var result: Double = 0
        
        if let extractedOperand = operands.dequeueItem() {
            result = extractedOperand
        }
        //operand에 값이있다면
        while operands.isEmpty == false {
            let firstOperand = result
            
            if let latterOperand = operands.dequeueItem(), let extractedOperator = operators.dequeueItem() {
                
                result = extractedOperator.calculate(lhs: firstOperand, rhs: latterOperand)
            }
        }
        return result
    }
    
}


