//
//  Formula.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/19.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else {
            return Double.nan
        }
        
        while !operators.isEmpty && !operands.isEmpty {
            let nextOperator = operators.dequeue()
            let nextOperand = operands.dequeue()
            result = nextOperator?.calculate(lhs: result, rhs: nextOperand ?? 0) ?? result
        }
        
        return result
    }
}
