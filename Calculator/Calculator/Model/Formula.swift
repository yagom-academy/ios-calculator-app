//
//  Formula.swift
//  Calculator
//
//  Created by Serena on 2023/06/05.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<String>
    
    mutating func result() -> Double {
        var lhs = operands.dequeue()!
        var rhs = operands.dequeue()!
        var result: Double = 0.0
        
        if operators.peek == String(Operator.add.rawValue) {
            result = Operator.add.calculate(lhs: lhs, rhs: rhs)
        }
        return result
    }
}
