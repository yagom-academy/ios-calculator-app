//
//  Formula.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/26.
//

import Foundation

struct Formula {
    let operators: CalculatorItemQueue<Character>
    
    let operands: CalculatorItemQueue<Double>
    
    func result() -> Double {
        return 1
    }
}


