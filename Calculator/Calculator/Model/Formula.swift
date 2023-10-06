//
//  Formula.swift
//  Calculator
//
//  Created by mireu on 2023/10/06.
//

struct Formula {
    var operands = CalculatorItemQueue<String>()
    var oprators = CalculatorItemQueue<String>()
    
    func result() -> Double {
        return 0
    }
}

