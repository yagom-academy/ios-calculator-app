//
//  Formula.swift
//  Created by Wonbi
//

import Foundation

struct Formula {
    let operands: CalculatorItemQueue = CalculatorItemQueue()
    let operators: CalculatorItemQueue = CalculatorItemQueue()
    
    func result() -> Double {
        return 0.0
    }
}
