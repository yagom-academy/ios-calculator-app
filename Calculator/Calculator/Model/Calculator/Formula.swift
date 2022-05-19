//
//  Formula.swift
//  Calculator
//
//  Created by 허건 on 2022/05/19.
//

struct Formula {
    var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue = CalculatorItemQueue<Any>()
    
    mutating func result() -> Double {
        let resultValue = operands.doFristPeekAndremove()
        
        return resultValue
    }
}
