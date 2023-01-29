//
//  Formula.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/26.
//

import Foundation

struct Formula {
    let operators: CalculatorItemQueue<Operator>
    
    let operands: CalculatorItemQueue<Double>
    
    mutating func result() -> Double {
        
        var result: Double = 1
        
        return result
    }
}


