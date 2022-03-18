//
//  Calculator.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/14.
//

import Foundation

struct Formula {
    var operands = LinkedQueue<Double>()
    var operators = LinkedQueue<Operator>()
    
    mutating func result() -> Double {
        guard var result = operands.removeFirst()?.value else { return .nan }
        
        while let oper = operators.removeFirst()?.value, let rhs = operands.removeFirst()?.value {
//            if oper == .divide && rhs == .zero { return .nan }
            result = oper.calculate(lhs: result, rhs: rhs)
        }
        return result
    }
}
