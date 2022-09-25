//
//  Formula.swift
//  Created by Wonbi
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
        guard let firstOperand = operands.dequeue() as? Double else { return .zero }
        var result = firstOperand

        while !operators.isEmpty || !operands.isEmpty {
            let firstOperand = result
            let secondOperand = operands.dequeue()
            let currentOperator = operators.dequeue()
            
            if let secondOperend = secondOperand as? Double,
               let currentOperator = currentOperator as? Operator {
                result = currentOperator.calculate(lhs: firstOperand, rhs: secondOperend)
            }
            
            if result.isNaN {
                return .nan
            }
        }

        return result
    }
}
