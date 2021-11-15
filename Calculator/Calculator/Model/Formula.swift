//
//  Formula.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/12.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue?
    var operators: CalculatorItemQueue?
    
    mutating func result() -> Double {
        var result = 0.0
        
        guard var operand1 = operands?.dequeue() as? Double else {
            return 0.0
        }
        
        while true {
            guard let operand2 = operands?.dequeue() as? Double else {
                break
            }
        
            if let `operator` = operators?.dequeue() as? Operator {
                result = `operator`.calculate(lhs: operand1, rhs: operand2)
            }
            operand1 = result
        }
        
        return result
    }
}
