//
//  Formula.swift
//  Calculator
//
//  Created by Charles on 2023/10/08.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        guard var accumulatingValue = operands.dequeue() else {
            throw OperateError.emptyQueueError
        }
        
        while let `operator` = operators.dequeue(), let rhs = operands.dequeue() {
            accumulatingValue = try `operator`.calculate(lhs: accumulatingValue, rhs: rhs)
        }
        
        return accumulatingValue
    }
}
