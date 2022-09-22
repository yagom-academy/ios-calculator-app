//
//  Formula.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/22.
//

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    mutating func result() -> Double {
        guard var result = operands.pop() as? Double else { return }
        
        while !operands.isEmpty {
            
        }
        
        return result
    }
}
