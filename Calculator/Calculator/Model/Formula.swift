//
//  Formula.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
}
