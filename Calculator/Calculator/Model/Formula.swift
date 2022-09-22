//
//  Formula.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/22.
//

struct Formula {
    let operands: CalculatorItemQueue<Double>()
    let operators: CalculatorItemQueue<Operator>()
    
    func result() -> Double {
        return 0
    }
}
