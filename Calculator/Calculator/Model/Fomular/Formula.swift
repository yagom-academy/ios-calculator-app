//
//  Fomular.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/18.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
}

extension Formula {
    func result() -> Double {
        do {
            var headOperand = try operands.dequeue()
            
            while !operands.isEmpty {
                let operand = try operands.dequeue()
                let arithmeticOperator = try operators.dequeue()
                
                headOperand = arithmeticOperator.calculate(lhs: headOperand, rhs: operand)
            }
            
            return headOperand
        } catch _ {
            return .nan
        }
    }
}
