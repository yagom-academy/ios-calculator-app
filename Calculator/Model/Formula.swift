//
//  Formula.swift
//  Calculator
//
//  Created by NAMU on 2022/05/19.
//

import UIKit

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators =  CalculatorItemQueue<Character>()
    private let defaultOperandsValue = 0.0
    
    mutating func result() -> Double {
        var result = operands.dequeue() ?? defaultOperandsValue
        while !operators.isEmpty() {
            result = Operator
                .init(rawValue: operators.dequeue() ?? " ")?
                .calculate(lhs: result, rhs: operands.dequeue() ?? defaultOperandsValue) ?? defaultOperandsValue
        }
        return result
    }
}
