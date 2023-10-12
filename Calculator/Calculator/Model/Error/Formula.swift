//
//  Formula.swift
//  Calculator
//
//  Created by mireu on 2023/10/06.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        guard var presentResult = operands.dequeue() else { return 0 }
        
        while let nextResult = operands.dequeue() {
            guard let operatorSign = operators.dequeue() else { return presentResult }
            
            presentResult = try operatorSign.calculate(lhs: presentResult, rhs: nextResult)
        }
        
        return presentResult
    }
}


