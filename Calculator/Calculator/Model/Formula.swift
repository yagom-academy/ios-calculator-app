//
//  Formula.swift
//  Calculator
//
//  Created by EUNJI CHOI on 2/16/24.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Double>
    
    mutating func result() -> Double {
        var result = 0.0
        while !operands.isEmpty {
            if let operand = operands.dequeue() {
                result += operand
            }
        }
        return result
    }
}
