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
    
    mutating func result() throws -> Double {
        guard var lhs = operands.dequeue() else {
            throw ErrorCase.operandsDequeue
        }
        
        while operands.linkedList.head != nil {
            guard let number = operands.dequeue() else {
                throw ErrorCase.operatorDequeue
            }
            guard  let result = operators.dequeue() else {
                throw ErrorCase.operatorDequeue
            }
            if lhs == 0.0 && result == Operator.divide {
                throw ErrorCase.operatorDequeue
            }
            lhs = result.calculate(Ihs: lhs, rhs: number)
        }
        
        return lhs
    }
}
