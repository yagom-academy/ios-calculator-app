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
            return .zero
        }
           var result = extractedOperand
        
        while operands.isEmpty == false {
            let lhsOperand = result
            
            if let rhsOperand = operands.dequeueItem(), let extractedOperator = operators.dequeueItem() {
                
                result = extractedOperator.calculate(lhs: lhsOperand, rhs: rhsOperand)
            }
        }
        return result
    }
    
}


