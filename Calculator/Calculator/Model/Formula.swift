//
//  Formula.swift
//  Calculator
//
//  Created by Erick on 2023/06/01.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        return Double(0)
    }
}
