//
//  Formula.swift
//  Calculator
//
//  Created by 권나영 on 2021/11/14.
//

import Foundation

struct Formula {
    var operands: CalculateItemQueue<Double>
    var operators: CalculateItemQueue<Operator>
}
