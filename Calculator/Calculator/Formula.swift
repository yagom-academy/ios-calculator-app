//
//  Formula.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/22.
//

import Foundation

struct Formula {
    let operands: CalculatorItemQueue<Double>
    let operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        return 0
    }
}
