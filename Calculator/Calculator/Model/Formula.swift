//
//  Formula.swift
//  Calculator
//
//  Created by Danny on 2/11/24.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    func result() -> Double {
        var result: Double = operands.dequeue()
        
        while !operands.isEmpty {
            switch operators.dequeue() {
            case "+":
                result = Operator.add.calculate(lhs: result, rhs: operands.dequeue())
            case "-":
                result = Operator.subtract.calculate(lhs: result, rhs: operands.dequeue())
            case "/":
                result = Operator.divide.calculate(lhs: result, rhs: operands.dequeue())
            default:
                result = Operator.multiply.calculate(lhs: result, rhs: operands.dequeue())
            }
        }
        
        return result
    }
}
