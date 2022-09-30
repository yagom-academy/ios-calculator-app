//
//  Formula.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/22.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>?
    var operators: CalculatorItemQueue<Operator>?
    
    mutating func result() -> Double {
        guard var result = operands?.dequeue() else {
            return 0
        }
        
        while let someOperator: Operator = operators?.dequeue(),
              let someOperand: Double = operands?.dequeue() {
            result = someOperator.calculate(lhs: result, rhs: someOperand)
        }
        
        return result
    }
}
