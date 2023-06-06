//
//  Formula.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/06/06.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard !operands.isEmpty else {
            return Double.nan
        }
        guard let firstOperand = operands.dequeue(), !firstOperand.isNaN else {
            return Double.nan
        }
        
        var result: Double = firstOperand
        
        while let operatorCase = operators.dequeue() {
            guard let nextOperand = operands.dequeue() else {
                return result
            }
            
            result = operatorCase.calculate(lhs: result, rhs: nextOperand)
        }
        
        return result
    }
}
