//
//  Formula.swift
//  Calculator
//
//  Created by unchain123 on 2022/05/19.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
    
    var operators: CalculatorItemQueue = CalculatorItemQueue<Character>()
    
    func result() -> Double {
        return 0.0
        
    }
}
