//
//  Formula.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/23.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
}
