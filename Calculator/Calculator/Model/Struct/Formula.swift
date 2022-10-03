//
//  Formula.swift
//  Calculator
//
//  Created by dragon on 2022/09/23.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            throw CalculatorError.emptyOperands
        }
        
        while !operands.isEmpty && !operators.isEmpty {
            guard let number = operands.dequeue() else {
                throw CalculatorError.noMoreOperands
            }
            guard let operators = operators.dequeue() else {
                throw CalculatorError.emptyOperators
            }
            
            result = try operators.calculate(lhs: result, rhs: number)
        }
            
        return result
    }
}
