//
//  Formula.swift
//  Created by Wonbi
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue = CalculatorItemQueue()
    var operators: CalculatorItemQueue = CalculatorItemQueue()
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() as? Double else { return 0.0 }

        while !operators.isEmpty || !operands.isEmpty {
            let firstOperand = result
            let secondOperand = operands.dequeue()
            let currentOperator = operators.dequeue()
            
            if let secondOperend = secondOperand as? Double,
               let currentOperator = currentOperator as? Operator {
                result = currentOperator.calculate(lhs: firstOperand, rhs: secondOperend)
            }
        }

        return result
    }
}
