//
//  Formula.swift
//  Calculator
//
//  Created by 박종화 on 2023/06/02.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()

    mutating func result() -> Double {
        guard let result: Double = operands.dequeue() else { return 0 }
        
        while operators.isEmpty {
            var lhs = result
            guard let rhs: Double = operands.dequeue() else { return 0 }
            guard let operation: Operator = operators.dequeue() else { return 0 }
            
            result = operation.calculate(lhs: lhs, rhs: rhs)
        }
        
        return result
    }
}
