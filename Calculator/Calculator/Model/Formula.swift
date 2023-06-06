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
        guard !operands.isEmpty else { return 0 }
        guard let firstOperand = operands.dequeue() else { return 0 }
        
        var result: Double = firstOperand
        
        while let `operator` = operators.dequeue() {
            guard let nextOperand = operands.dequeue() else { return 0 }
            result = `operator`.calculate(lhs: result, rhs: nextOperand)
        }
        
        return result
    }
}
