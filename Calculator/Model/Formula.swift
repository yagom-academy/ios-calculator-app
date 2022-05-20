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
            result = try operators.dequeue().calculate(lhs: result, rhs: operands.dequeue())
        }
        
        guard result != Double.infinity else {
            throw CalculateError.infinityError
        }
        
        return result
    }
}
