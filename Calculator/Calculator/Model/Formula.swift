//
//  Formula.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/06/06.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard !operands.isEmpty else { return 0 }
        guard let firstInput = operands.dequeue() else { return 0 }
        guard !operators.isEmpty else { return firstInput }
        guard let `operator` = operators.dequeue() else { return -1 }
        
        let result = `operator`.calculate(lhs: firstInput, rhs: operands.dequeue()!)
        
        return result
    }
}
