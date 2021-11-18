//
//  Formula.swift
//  Calculator
//
//  Created by LIMGAUI on 2021/11/17.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators =  CalculatorItemQueue<Operator>()
        
    mutating func result() -> Double {

    }
}
