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
        
        guard var leftOperand = operands?.dequeue() as? Double else {
            return Double.zero
        }
        
        while true {
            guard let rightOperand = operands?.dequeue() as? Double else {
                break
            }
        
            if let `operator` = operators?.dequeue() as? Operator {
                leftOperand = `operator`.calculate(lhs: leftOperand, rhs: rightOperand)
            }
        }
        
        return leftOperand
    }
}
