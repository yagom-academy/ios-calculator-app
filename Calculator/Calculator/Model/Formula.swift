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
            return .zero
        }
        var result: Double = 0
        
        while !operators.isEmpty {
            guard let operatorSymbol = operators.dequeue() else {
                return lhs
            }
            
            guard let rhs = operands.dequeue() else {
                throw CalculatorError.invalidOperandError
            }
            
            lhs = try operatorSymbol.calculate(lhs: lhs, rhs: rhs)
            result = lhs
        }
        
        return result
    }
}
