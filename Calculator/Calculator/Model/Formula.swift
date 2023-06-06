//
//  Formula.swift
//  Calculator
//
//  Created by 비모 on 2023/06/05.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result: Double = 0.0
        
        while operands.peek() != nil {
            let lhs = result
            
            guard let `operator` = operators.dequeue() else {
                return result
            }
            
            guard let rhs = operands.dequeue() else {
                return result
            }
            
            result = `operator`.calculate(lhs: lhs, rhs: rhs)
        }
        
        return result
    }
}
