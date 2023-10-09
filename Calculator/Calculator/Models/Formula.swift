//
//  Formula.swift
//  Calculator
//
//  Created by Toy on 10/9/23.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Double>
    
    func result() -> Double {
        return 0.0
    }
}
