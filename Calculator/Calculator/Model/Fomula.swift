//
//  Fomula.swift
//  Calculator
//
//  Created by 김태훈 on 2022/03/28.
//

import Foundation

struct Fomula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    func result() {
        // return Double
    }
}
