//
//  Formula.swift
//  Calculator
//
//  Created by Jaehun Lee on 2/12/24.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            return 0.0
        }
        
        while !operators.isEmpty {
            guard let `operator` = operators.dequeue(),
                  let operand = operands.dequeue() else {
                return 0.0
            }
            
            result = try `operator`.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}
