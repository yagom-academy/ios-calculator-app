//
//  Formula.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/23.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        guard var result: Double = operands.deQueue() else {
            throw ValueError.emptyOperandsQueue
        }
        
        while !operands.isEmpty {
            guard let inputOperator = operators.deQueue() else {
                throw ValueError.emptyOperatorsQueue
            }
            
            guard let inputOperands = operands.deQueue() else {
                throw ValueError.emptyOperandsQueue
            }
            
            result = try inputOperator.calculate(lhs: result, rhs: inputOperands) ?? 0
        }
        
        return result
    }
}
