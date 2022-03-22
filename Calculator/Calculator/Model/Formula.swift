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
        var result = operands.removeFirst() ?? .zero

        while let operators = operators.removeFirst(), let rhs = operands.removeFirst() {
            result = operators.calculate(lhs: result, rhs: rhs)
        }
        return result
    }
}
