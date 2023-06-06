//
//  Fornula.swift
//  Calculator
//
//  Created by mint on 2023/06/02.
//

import Foundation

struct Formula {
    var operators = CalculatorItemQueue<Operator>()
    var operands = CalculatorItemQueue<Double>()
    
    mutating func result() throws -> Double {
        guard var firstOperand = operands.dequeue() else { throw CalculatorErrors.unfinishedFormula }
        
        while let newOperator = operators.dequeue() {
            guard let SecondOperand = operands.dequeue() else { throw CalculatorErrors.unfinishedFormula }
            
            firstOperand = try newOperator.calculate(lhs: firstOperand, rhs: SecondOperand)
        }
        
        return firstOperand
    }
}
