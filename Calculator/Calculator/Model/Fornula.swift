//
//  Fornula.swift
//  Calculator
//
//  Created by mint on 2023/06/02.
//

import Foundation

struct Formula {
    var operators = CalculatorItemQueue<Operator>()
    var operands = CalculatorItemQueue<Double>()
    
    mutating func result() -> Double {
        var calculateByOperators = operators.dequeue()
        guard var result = operands.dequeue() else { return 0 }
        
        while calculateByOperators == nil {
            guard let identifiedOperator = calculateByOperators else { break }
            guard let rhs = operands.dequeue() else { break }
            
            result = identifiedOperator.calculate(lhs: result, rhs: rhs)
        }
        
        
        return result
    }
}
