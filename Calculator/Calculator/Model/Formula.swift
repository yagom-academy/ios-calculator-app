//
//  Formula.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/14.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
}
