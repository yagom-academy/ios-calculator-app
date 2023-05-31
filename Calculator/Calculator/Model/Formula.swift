//
//  Formula.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        var temp: Double = 0.0
        
        let lhs = operands.dequeue() ?? 0.0
        let rhs = operands.dequeue() ?? 0.0
        temp = try operators.dequeue()?.calculate(lhs: lhs, rhs: rhs) ?? 0.0
        
        while !operands.isEmpty {
            let rhs = operands.dequeue() ?? 0.0
            temp = try operators.dequeue()?.calculate(lhs: temp, rhs: rhs) ?? 0.0
        }
        
        return temp
    }
}
