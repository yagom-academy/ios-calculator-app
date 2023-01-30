//
//  Formula.swift
//  Calculator
//
//  Created by Harry on 2023/01/27.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var calculationResult: Double = 0
        
        if let firstOperand = operands.dequeue() {
            calculationResult = firstOperand
        }
        
        while !operands.list.isEmpty {
            let leftHandSide = calculationResult
            guard let rightHandSide = operands.dequeue() else { break }
            guard let `operator` = operators.dequeue() else { break }

            calculationResult = `operator`.calculate(lhs: leftHandSide, rhs: rightHandSide)
            guard calculationResult.isNaN == false  else { return Double.nan }
        }
        
        return calculationResult
    }
}
