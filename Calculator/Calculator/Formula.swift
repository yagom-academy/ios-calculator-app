//
//  Formula.swift
//  Calculator
//
//  Created by 천승현 on 2023/01/27.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() -> Double {
        guard let initialValue = operands.dequeue() else { return .zero }
        
        var sum = initialValue
        
        while !operands.isEmpty {
            if let nextValue = operands.dequeue(), let oper = operators.dequeue() {
                sum = oper.calculate(lhs: sum, rhs: nextValue)
            }
        }
        
        return sum
    }
}
