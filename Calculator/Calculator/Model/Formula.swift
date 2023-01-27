//
//  Formula.swift
//  Calculator
//
//  Created by Harry on 2023/01/27.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var calculationResult: Double = 0
        while operands.list.isEmpty {
            guard let firstOperand = operands.dequeue() else { break }
            guard let secondOperand = operands.dequeue() else { break }
            guard let `operator` = operators.dequeue() else { break }
            
            calculationResult = `operator`.calculate(lhs: firstOperand, rhs: secondOperand)
        }
        
        return calculationResult
    }
}
