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
        
        while !operators.isEmpty {
            guard let `operator` = operators.dequeue() else { break }
            
            guard let rhs = operands.dequeue() else { break }
            accumulatingValue = `operator`.calculate(lhs: accumulatingValue, rhs: rhs)

        }
        
        return accumulatingValue
    }
}
