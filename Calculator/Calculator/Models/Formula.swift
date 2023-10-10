//
//  Formula.swift
//  Calculator
//
//  Created by Toy on 10/9/23.
//


struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    func result() -> Double {
        return 0.0
    }
}
