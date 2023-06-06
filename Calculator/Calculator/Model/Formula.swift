//
//  Formula.swift
//  Calculator
//
//  Created by Serena on 2023/06/05.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<String>
    
    mutating func result() throws -> Double? {
        guard let lhs = operands.dequeue(), let rhs = operands.dequeue() else {
            throw CalculateError.invalid
        }
        var result: Double = 0.0
        
        if operators.peek == String(Operator.add.rawValue) {
            result = Operator.add.calculate(lhs: lhs, rhs: rhs)
        }
        return result
    }
}
