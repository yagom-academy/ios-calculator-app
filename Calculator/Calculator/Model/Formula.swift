//
//  Formula.swift
//  Calculator
//
//  Created by Dasan on 2023/06/02.
//

struct Formula<OperandQueue: Queueable, OperatorQueue: Queueable> where OperandQueue.T == Double, OperatorQueue.T == Operator {
    var operands: OperandQueue
    var operators: OperatorQueue
    
    mutating func result() -> Double {
        guard var accumulatedValue = operands.dequeue() else { return 0.0 }
        
        while let operand = operands.dequeue(),
              let `operator` = operators.dequeue() {
            accumulatedValue = `operator`.calculate(lhs: accumulatedValue, rhs: operand)
        }
    
        return accumulatedValue
    }
}
