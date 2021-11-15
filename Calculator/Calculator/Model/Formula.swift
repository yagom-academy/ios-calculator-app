//
//  Formula.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/14.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        let zeroValue = 0.0
        guard var resultValue = operands.delete() else { return zeroValue }
        
        while true {
            guard let operatorInstance = operators.delete(), let operandValue = operands.delete() else {
                break
            }
            resultValue = try operatorInstance.calculate(lhs: resultValue, rhs: operandValue)
        }
        
        return resultValue
    }
}
