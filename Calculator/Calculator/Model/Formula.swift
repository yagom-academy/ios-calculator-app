//
//  Formula.swift
//  Calculator
//
//  Created by mireu on 2023/10/06.
//

struct Formula {
    var operands = CalculatorItemQueue<Operator>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        return 0
    }
}

