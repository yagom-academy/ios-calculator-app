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
        
        do {
            while operands.linkedList.head != nil {
                guard let number = operands.dequeue() else {
                    throw ErrorCase.operandsDequeue
                }
                
                guard let result = operators.dequeue() else {
                    throw ErrorCase.operatorDequeue
                }
                
                if result == Operator.divide && number == 0.0 {
                    throw ErrorCase.divideByZero
                }
                
                lhs = result.calculate(lhs: lhs, rhs: number)
            }
        } catch ErrorCase.divideByZero {
            return .nan
        }
        
        return lhs
    }
}
