//
//  Formula.swift
//  Calculator
//
//  Created by Hyungmin Lee on 2023/06/02.
//
struct Formula<OperandQueue: Queueable, OperatorQueue: Queueable> where OperandQueue.Element == Double, OperatorQueue.Element == Operator {
    var operands: OperandQueue
    var operators: OperatorQueue
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else { return 0.0 }
        
        while operators.isEmpty == false {
            guard let operand = operands.dequeue(),
                  let `operator` = operators.dequeue() else { return 0.0 }

            result = `operator`.calculate(lhs: result, rhs: operand)
        }

        return result
    }
}
