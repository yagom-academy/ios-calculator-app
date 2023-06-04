//
//  Fornula.swift
//  Calculator
//
//  Created by mint on 2023/06/02.
//

import Foundation

struct Formula {
    var operators: CalculatorItemQueue<Operator>? //연산자
    var operands: CalculatorItemQueue<Double>? //피연산자
    
    func result() -> Double {
        return 1.0
    }
}
