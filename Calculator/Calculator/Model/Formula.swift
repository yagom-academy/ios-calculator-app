//
//  Formula.swift
//  Calculator
//
//  Created by 무리 on 2023/01/27.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        print(operands)
        print(operators)
        var result: Double = 0
        
        guard let firstOperand = operands.dequeue() else {
            return .zero
        }
        result = firstOperand
        
        while operands.count > 0 {
            guard let nextOperand = operands.dequeue() else {
                return .zero
            }
            guard let operatorSgin = operators.dequeue() else {
                return .nan
            }
            
            result = operatorSgin.calculate(lhs: result, rhs: nextOperand)
        }
 
        return result
    }
}


