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
        
        if operands.isEmpty {
            return result
        }
        
        if operands.count == 1, let number = operands.dequeue() {
            return number
        }
        
        guard let lhs = operands.dequeue() else {
             return result
        }
        
        result = lhs
        
        while operands.peek() != nil {
            guard let rhs = operands.dequeue() else {
                return result
            }
            
            guard let `operator` = operators.dequeue() else {
                return result
            }
            
            result = `operator`.calculate(lhs: result, rhs: rhs)
        }
        
        return result
    }
}
