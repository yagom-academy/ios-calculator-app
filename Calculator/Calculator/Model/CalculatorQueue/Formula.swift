//
//  Formula.swift
//  Calculator
//
//  Created by 허건 on 2022/05/19.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard var lhs = operands.dequeue() else {
            return 0.0
        }
        
        while operands.linkedList.head != nil {
            guard let number = operands.dequeue(),
                  let result = operators.dequeue() else {
                return 0.0
            }
            
            lhs = result.calculate(Ihs: lhs, rhs: number)
        }
            
        return lhs
    }
}
