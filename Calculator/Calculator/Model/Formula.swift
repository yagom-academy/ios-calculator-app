//
//  Formula.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/22.
//

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    func result() -> Double {
        return 0
    }
}
