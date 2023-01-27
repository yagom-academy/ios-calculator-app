//  Formula.swift
//  Created by 레옹아범 on 2023/01/26.

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        return 0.0
    }
}
