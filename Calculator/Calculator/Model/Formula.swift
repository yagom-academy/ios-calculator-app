//
//  Formula.swift
//  Calculator
//
//  Created by Hamo on 2022/09/26.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    mutating func result() throws -> Double? {
        guard var lhs = operands.dequeue() else {
            return nil
        }
        
        while !operators.isEmpty() {
            guard let rhs = operands.dequeue() else {
                return lhs
            }
            
            guard let arithmeticOperator = operators.dequeue() else {
                throw CalculatorError.emptyOperator
            }
            
            lhs = try arithmeticOperator.calculate(lhs: lhs, rhs: rhs)
        }
        
        let result = lhs
        
        return result
    }
}
