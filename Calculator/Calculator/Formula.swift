//
//  Formula.swift
//  Calculator
//
//  Created by jin on 10/4/22.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>.init()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>.init()
    
    mutating func result() -> Double {
        var result: Double
        
        guard let firstNumber = operands.dequeue() else { return 0.0 }
        
        result = firstNumber
        
        while operators.isEmpty != true {
            guard let operators = operators.dequeue() else { return 0.0 }
            guard let operands = operands.dequeue() else { return 0.0 }
            
            result = operators.calculate(lhs: result, rhs: operands)
        }
        return result
    }
}
