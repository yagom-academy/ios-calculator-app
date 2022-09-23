//
//  Formula.swift
//  Calculator
//
//  Created by junho lee on 2022/09/23.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    func result() -> Double {
        return 0
    }
}
