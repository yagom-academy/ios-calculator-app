//
//  Formula.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/22.
//

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    mutating func result() throws -> Double {
        guard var result = operands.pop() as? Double else {
            throw CalculatorError.queueIsEmpty
            
        }
        
        while !operands.isEmpty {
            
        }
        
        return result
    }
}
