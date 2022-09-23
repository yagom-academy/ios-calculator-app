//
//  Formula.swift
//  Calculator
//
//  Created by 이정민 on 2022/09/23.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else {
            return 0
        }
        
        while !operands.isEmpty() {
            guard let operant = operators.dequeue(),
                  let number = operands.dequeue() else {
                break
            }
            
            result = operant.calculate(lhs: result, rhs: number)
        }
        
        return result
    }
}
