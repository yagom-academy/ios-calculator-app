//
//  Formula.swift
//  Calculator
//
//  Created by 허건 on 2022/05/19.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue = CalculatorItemQueue<Double>() // 숫자
    var operators: CalculatorItemQueue = CalculatorItemQueue<Operator>() // 연산자
    
    mutating func result() -> Double {
        return 
    }
}
