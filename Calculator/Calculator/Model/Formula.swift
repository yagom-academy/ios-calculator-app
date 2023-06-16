//
//  Formula.swift
//  Calculator
//
//  Created by Zion & Dasan on 2023/06/02.
//

struct Formula<OperandQueue: Queueable, OperatorQueue: Queueable> where OperandQueue.Element == Double, OperatorQueue.Element == Operator {
    var operands: OperandQueue
    var operators: OperatorQueue
    
    mutating func result() -> Double {
        guard var accumulatedValue = operands.dequeue() else { return 0.0 }
        
        while let operand = operands.dequeue(),
              let operatorSymbol = operators.dequeue() {
            accumulatedValue = operatorSymbol.calculate(lhs: accumulatedValue, rhs: operand)
        }
    
        return accumulatedValue
    }
}
