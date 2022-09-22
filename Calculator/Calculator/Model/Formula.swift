//
//  Formula.swift
//  Calculator
//
//  Created by 써니쿠키 on 2022/09/22.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        // 코드 구현 예정
        return 0.0
    }
}
