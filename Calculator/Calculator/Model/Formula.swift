//
//  Formula.swift
//  Calculator
//
//  Created by Whales on 2023/06/07.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        if operands.isEmpty {
            return 0
        } else if operators.isEmpty, let result = operands.readFirstData() {
            return result
        }
        
        var result: Double = try operands.dequeue()
        
        result = try operators.dequeue().calculate(lhs: result, rhs: try operands.dequeue())
        
        while !operands.isEmpty {
            result = try operators.dequeue().calculate(lhs: result, rhs: try operands.dequeue())
        }
        
        return result
    }
}
