//
//  Formula.swift
//  Calculator
//
//  Created by Dasan on 2023/06/02.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result: Double = 0.0
        
        if operands.count >= 2 && operators.count >= 1 {
            if let leftValue = operands.dequeue(),
               let rightValue = operands.dequeue(),
               let currentOperator = operators.dequeue() {
                result = currentOperator.calculate(lhs: leftValue, rhs: rightValue)
                operands.enqueue(result)
            }
        } else {
            if let currentOperand = operands.first {
                result = currentOperand
            }
        }
    
        return result
    }
}
