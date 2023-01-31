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
                do {
                    result = try extractedOperator.calculate(lhs: lhsOperand, rhs: rhsOperand)
                } catch {
                    result = Double.nan
                    //0으로 나누기에 대해서는 결과값을 Nan으로 표시
                }
            }
        return result
    }
        
}



