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
        guard var firstResult = operands.dequeue() else { return 0 }
        
        while !operators.isEmpty {
            guard let secondResult = operands.dequeue() else { return 0 }
            
            guard let operatorSign = operators.dequeue() else { return 0 }
            
            firstResult = try operatorSign.calculate(lhs: firstResult, rhs: secondResult)
        }
        return firstResult
    }
}


