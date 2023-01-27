//
//  Formula.swift
//  Calculator
//
//  Created by 김성준 on 2023/01/27.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<String>    
    
    func result() -> Double {
        return 0
    }
}
