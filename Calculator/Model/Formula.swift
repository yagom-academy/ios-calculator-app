//
//  Formula.swift
//  Calculator
//
//  Created by NAMU on 2022/05/19.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators =  CalculatorItemQueue<Character>()
    
    func result() -> Double {
        return 0
    }
}
