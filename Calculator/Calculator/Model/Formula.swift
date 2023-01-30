//
//  Formula.swift
//  Calculator
//
//  Created by kimseongjun on 2023/01/27.
//

import Foundation
 
struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        var currentResult: Double = 0
        
        if let firstOperand = operands.dequeue() {
            currentResult = firstOperand
        }
        
        while operands.isEmpty == false {
            let formerOperand = currentResult
            
            if let latterOperand = operands.dequeue(), let operatorType = operators.dequeue() {
                currentResult = operatorType.calculate(lhs: formerOperand, rhs: latterOperand)
            }
        }
        return currentResult
    }
}
