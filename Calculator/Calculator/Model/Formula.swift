//
//  Formula.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/09.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Character>
    
    func result() -> Double {
        
        return 0.0
    }
}
