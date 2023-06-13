//
//  Fornula.swift
//  Calculator
//
//  Created by mint, Whales on 2023/06/02.
//

import Foundation

struct Formula {
    var operators = CalculatorItemQueue<Operator>()
    var operands = CalculatorItemQueue<Double>()
    
    mutating func result() -> Double {
        guard var firstOperand = operands.dequeue() else {
            return 0
        }
        
        while let newOperator = operators.dequeue(),
              let secondOperand = operands.dequeue() {
            firstOperand = newOperator.calculate(lhs: firstOperand, rhs: secondOperand)
        }
        
        return firstOperand
    }
}
