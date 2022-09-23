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
        
        // 1 + 2 + 3 + 5 = 11
        operands?.enqueue(20)
        operators?.enqueue(.add)
        
        let someOperands = operands?.dequeue()
        if someOperands == nil {
            
        }
        let someOperators = operators?.dequeue()
        
        return 0
    }
}
