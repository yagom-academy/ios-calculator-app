//
//  Formula.swift
//  Calculator
//
//  Created by Charles on 2023/10/08.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        var accumulatingValue: Double = 0
        
        if let initialValue = operands.dequeue() {
            accumulatingValue = initialValue
        }
        
        while !operators.isEmpty {
            guard let operatingSymbol = operators.dequeue() else { break }
            
            guard let rhs = operands.dequeue() else { break }
            accumulatingValue = operatingSymbol.calculate(lhs: accumulatingValue, rhs: rhs)

        }
        
        return accumulatingValue
    }
}
