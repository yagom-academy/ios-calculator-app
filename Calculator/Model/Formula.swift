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
        var result = operands.dequeue() ?? 0
        
        while let operands = operands.dequeue(), let operators = operators.dequeue() {
            result = try operators.calculate(lhs: result, rhs: operands)
        }
        return result
    }
}
