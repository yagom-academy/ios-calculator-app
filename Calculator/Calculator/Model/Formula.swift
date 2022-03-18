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
    
    //0으로 나눴을때 nan 표기
    mutating func result() -> Double {
        guard var resultNumber = operands.removeFirst()?.value else { return .zero }
        
        while operators.isEmpty != true {
            
            guard let rhs = operands.removeFirst()?.value else { return .zero }
            let oper = operators.removeFirst()
            
            if oper?.value == Operator.divide && rhs == .zero {
                return .nan
            } else {
                resultNumber = oper?.value?.calculate(lhs: resultNumber, rhs: rhs) ?? .zero
            }
        }
        return resultNumber
    }
    
    
    
}
