//
//  Formula.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/22.
//

import Foundation

struct Formula {
    let operands: CalculatorItemQueue<Any>
    let operators: CalculatorItemQueue<Any>
    
    func result() -> Double {
        return 0
    }
}
