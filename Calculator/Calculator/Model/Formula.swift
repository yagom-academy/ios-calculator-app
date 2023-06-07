//
//  Formula.swift
//  Calculator
//
//  Created by Serena on 2023/06/05.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<String>
    
    mutating func result() throws -> Double {
        var result: Double = 0.0
        var lhs: Double?
        
        while !operators.isEmpty {
            (result == 0.0) ? (lhs = operands.dequeue()) : (lhs = result)
            
            guard let lhs,
                  let rhs = operands.dequeue(),
                  let modifier = operators.dequeue() else {
                throw CalculateError.invalid
            }
            
            if let compute = Operator(rawValue: Character(modifier)) {
                do {
                    result = try compute.calculate(lhs: lhs, rhs: rhs)
                } catch CalculateError.voidNumber {
                    result = 0.0
                }
            }
        }
        
        return result
    }
}
