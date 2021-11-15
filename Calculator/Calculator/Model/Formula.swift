//
//  Formula.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/12.
//

import Foundation

struct Formula {
    
    // MARK: property
    var operands: CalculatorItemQueue?
    var operators: CalculatorItemQueue?
}

// MARK: method
extension Formula {
    mutating func result() -> Double {
        guard var leftOperand = operands?.dequeue() as? Double else {
            return Double.zero
        }
        
        while let rightOperand = operands?.dequeue() as? Double,
              let calculateOperator = operators?.dequeue() as? Operator {
            leftOperand = calculateOperator.calculate(lhs: leftOperand, rhs: rightOperand)
        }
        
        return leftOperand
    }
}
