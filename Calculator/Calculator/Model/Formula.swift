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
        guard var partialResult = operands.dequeue(), !partialResult.isNaN else {
            return Double.nan
        }
        
        while let operatorCase = operators.dequeue() {
            guard let nextOperand = operands.dequeue() else {
                return partialResult
            }
            
            partialResult = operatorCase.calculate(lhs: partialResult, rhs: nextOperand)
        }
        
        return partialResult
    }
}
