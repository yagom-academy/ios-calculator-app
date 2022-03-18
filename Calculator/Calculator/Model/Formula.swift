//
//  Formula.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/18.
//

import Foundation

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>

    init(operands: CalculatorItemQueue<Double>,
         operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    func result() -> Double {
        
    }
}
