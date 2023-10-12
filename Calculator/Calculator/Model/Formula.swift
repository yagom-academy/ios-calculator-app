//
//  Formula.swift
//  Calculator
//
//  Created by Kiseok on 2023/10/11.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var lhs = operands.dequeue() else {
            return 0
        }
        var result: Double = 0
        
        while !operators.isEmpty {
            guard let operators = operators.dequeue() else {
                throw CalculatorError.invalidOperatorError
            }
            
            guard let rhs = operands.dequeue() else {
                throw CalculatorError.invalidOperandError
            }
            
            lhs = try operators.calculate(lhs: lhs, rhs: rhs)
            result = lhs
        }
        
        return result
    }
}
