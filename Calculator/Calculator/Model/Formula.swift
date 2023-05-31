//
//  Formula.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

struct Formula {
    let operands: CalculatorItemQueue<Double>
    let operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        return 0.0
    }
}
