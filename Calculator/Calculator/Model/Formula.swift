//
//  Formula.swift
//  Calculator

import Foundation
import UIKit

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    init(operrands: CalculatorItemQueue, operators: CalculatorItemQueue) {
        self.operands = operrands
        self.operators = operators
    }
    
    func result() -> Double {
        return 0
    }
}
