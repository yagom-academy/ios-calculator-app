//
//  Formula.swift
//  Calculator
//
//  Created by 천승현 on 2023/01/27.
//
struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() -> Double {
        guard var sum = operands.dequeue() else { return .zero }
        
        while !operands.isEmpty {
            if let nextValue = operands.dequeue(), let `operator` = operators.dequeue() {
                sum = `operator`.calculate(lhs: sum, rhs: nextValue)
            }
        }
        
        return sum
    }
}
