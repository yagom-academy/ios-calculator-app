//
//  Formula.swift
//  Calculator
//
//  Created by 허건 on 2022/05/19.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> // 숫자
    var operators: CalculatorItemQueue<Operator> // 연산자
    
//    mutating func result() -> Double {
//        var resuit = operands.dequeue()
//        
//        var oper = operators.dequeue()
//        
//        resuit = Operator.calculate(Ihs: resuit, rhs: oper)
//        return resuit
//    }
}
