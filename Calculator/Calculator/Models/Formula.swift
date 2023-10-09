//
//  Formula.swift
//  Calculator
//
//  Created by Charles on 2023/10/08.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        return 0
    }
}
