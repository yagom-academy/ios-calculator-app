//
//  Formula.swift
//  Calculator
//
//  Created by Hyungmin Lee on 2023/06/02.
//
struct Formula {
    var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue = CalculatorItemQueue<Operator>()
    
    func result() -> Double {
        return 0.0
    }
}
