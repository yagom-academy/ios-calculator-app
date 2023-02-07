//
//  Formula.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/26.
//

import Foundation

struct Formula {
    
    var operators: CalculatorItemQueue<Operator>
    var operands: CalculatorItemQueue<Double>
    
    mutating func result() -> Double {
        
        guard let extractedOperand = operands.dequeueItem() else {
            return 0.0
        }
        
        var result = extractedOperand
        
        while operands.isEmpty == false {
            let lhsOperand = result
            
            guard let rhsOperand = operands.dequeueItem(), let extractedOperator = operators.dequeueItem() else {
                continue
            }
            
            result = extractedOperator.calculate(lhs: lhsOperand, rhs: rhsOperand)
            guard result.isNaN == false else { return Double.nan }
        }
        
        return result
    }
}



