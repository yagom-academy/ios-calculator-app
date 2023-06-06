//
//  Formula.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/06.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operatos: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    func result() -> Double {
        return 0.1 //임시값
    }
}
