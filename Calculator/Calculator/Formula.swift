//
//  Formula.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/06.
//

struct Formula<T> {
    var operands: CalculatorItemQueue<T>
    var operatos: CalculatorItemQueue<T>
    
    func result() -> Double {
        return 0.1 //임시값
    }
}
