//
//  Formula.swift
//  Calculator
//
//  Created by 1 on 2021/11/15.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    init(operands: CalculatorItemQueue, operators: CalculatorItemQueue) {
        self.operands = operands
        self.operators = operators
    }
}
