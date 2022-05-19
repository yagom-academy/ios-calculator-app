//
//  Formula.swift
//  Calculator
//
//  Created by unchain123 on 2022/05/19.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    
    var operators: CalculatorItemQueue<Any>
    
    func result() -> Double {
        return 0.0
        
    }
}
