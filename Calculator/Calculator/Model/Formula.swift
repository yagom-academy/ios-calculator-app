//
//  Formula.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/22.
//

struct Formula {
    private var operands = CalculatorItemQueue<Double>()
    private var operators = CalculatorItemQueue<Operator>()
    
    mutating func setUpOperands(operands: [Double]) {
        self.operands = CalculatorItemQueue(elements: operands)
    }
    
    mutating func setUpOperators(operators: [Operator]) {
        self.operators = CalculatorItemQueue(elements: operators)
    }
    
    func result() -> Double {
        return 0
    }
}
