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
        var `operator` = operators.dequeue()
        guard var result = operands.dequeue() else { return 0 }
        
        while `operator` != nil {
            guard let identifiedOperator = `operator` else { break }
            guard let newOperand = operands.dequeue() else { break }
            
            result = identifiedOperator.calculate(lhs: result, rhs: newOperand)
            `operator` = operators.dequeue()
        }
        
        return result
    }
}
