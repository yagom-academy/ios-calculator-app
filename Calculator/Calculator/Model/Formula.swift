//
//  Formula.swift
//  Calculator
//
//  Created by Sunwoo on 2021/11/16.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    func result() -> Double {
        return Double()
    }
}
