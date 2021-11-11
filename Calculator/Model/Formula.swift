//
//  Formula.swift
//  Calculator
//
//  Created by 황제하 on 2021/11/11.
//

import Foundation

struct Formula {
    let operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    let operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    func result() -> Double {
        return self.operands.dequeue() ?? 0
    }
}
