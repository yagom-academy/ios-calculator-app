//
//  Formula.swift
//  Calculator
//
//  Created by Charles on 2023/10/08.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        var accumulatingValue: Double = .zero
        
        if let initialValue = operands.dequeue() {
            accumulatingValue = initialValue
        }
        
        while !operators.isEmpty, let `operator` = operators.dequeue(), let rhs = operands.dequeue() {
            accumulatingValue = `operator`.calculate(lhs: accumulatingValue, rhs: rhs)
        }
        
        return accumulatingValue
    }
}
