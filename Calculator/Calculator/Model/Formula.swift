//
//  Formula.swift
//  Calculator
//
//  Created by Hamo on 2022/09/26.
//

struct Formula {
    let operands: CalculatorItemQueue<Double>
    let operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    func result() -> Double {
        return 0.0
    }
}
