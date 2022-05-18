//
//  Formula.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/18.
//

struct Formula {
    var operands =  CalculatorItemQueue<Double>()
    var operators =  CalculatorItemQueue<Double>()
    
    func result() -> Double {
        return 0.0
    }
}
