//
//  Formula.swift
//  Calculator
//
//  Created by jyubong on 10/10/23.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    
}

extension Double: CalculatorItem { }
