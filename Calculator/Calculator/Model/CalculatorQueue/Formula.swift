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
        guard let rhs = operands.dequeue(),
              let lhs = operands.dequeue(),
              let result = operators.dequeue() else {
            return 0.0
        }
        
        let answer = result.calculate(Ihs: lhs, rhs: rhs)
        
        return answer
        
    }
}
