//
//  Formula.swift
//  Calculator
//
//  Created by 비모 on 2023/06/05.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            return 0.0
        }
        
        while let `operator` = operators.dequeue(), let nextOperand = operands.dequeue() {
            result = try `operator`.calculate(lhs: result, rhs: nextOperand)
        }
        
        return result
    }
}
