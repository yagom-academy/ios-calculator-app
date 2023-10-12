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
        
        while let secondResult = operands.dequeue() {
            guard let operatorSign = operators.dequeue() else { return firstResult }
            
            firstResult = try operatorSign.calculate(lhs: firstResult, rhs: secondResult)
        }
        return firstResult
    }
}


