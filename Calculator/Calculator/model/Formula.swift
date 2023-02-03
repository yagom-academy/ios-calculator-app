//
//  Formula.swift
//  Calculator
//
//  Created by Seoyeon Hong on 2023/01/31.
//

struct Formula {
    
    var operands: CalculatorItemQueue<Double> = .init()
    var operators: CalculatorItemQueue<Operator> = .init()
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else { return .zero }
        
        while let rhs = operands.dequeue(),
               let operators = operators.dequeue() {
                result = operators.calculate(lhs: result, rhs: rhs)
            }
        
        return result
    }
    
}
