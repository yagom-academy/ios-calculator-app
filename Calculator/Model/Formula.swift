//
//  Formula.swift
//  Calculator
//
//  Created by NAMU on 2022/05/19.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators =  CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        var result = try operands.dequeue()
        
        while !operands.isEmpty() || !operators.isEmpty() {
            guard operands.peek() != 0 || operators.peek() != .divide else {
                throw CalculateError.infinityError
            }
            result = try operators.dequeue().calculate(lhs: result, rhs: operands.dequeue())
        }
        
        return result
    }
}
