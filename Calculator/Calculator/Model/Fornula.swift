//
//  Fornula.swift
//  Calculator
//
//  Created by mint on 2023/06/02.
//

import Foundation

struct Formula {
    var operators: CalculatorItemQueue<Operator>
    var operands: CalculatorItemQueue<Double>
    
    init(operators: CalculatorItemQueue<Operator>, operands: CalculatorItemQueue<Double>) {
        self.operators = operators
        self.operands = operands
    }
    
    mutating func result() -> Double {
        var calculateByOperators = operators.dequeue()
        var intermediateResult = operands.dequeue()
        
        while calculateByOperators == nil {
            guard let identifiedOperator = calculateByOperators else { break }
            guard let lhs = intermediateResult else { break }
            guard let rhs = operands.dequeue() else { break }
            
            intermediateResult = identifiedOperator.calculate(lhs: lhs, rhs: rhs)
        }
        
        guard let result = intermediateResult else { return 0 }
        
        return result
    }
}
