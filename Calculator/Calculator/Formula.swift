//  Formula.swift
//  Calculator
//  Created by LJ on 2022/09/22.

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() -> Double {
        var operatorsValue = operators.dequeue()
        var lhs = operands.dequeue() ?? 99.999
        var rhs = operands.dequeue() ?? 99.999
        var result = operatorsValue?.calculate(lhs: lhs, rhs: rhs) ?? 99.999
        
        while !operands.dequeueStack.isEmpty {
            lhs = result
            rhs = operands.dequeue() ?? 99.999
            operatorsValue = operators.dequeue()
            result = operatorsValue?.calculate(lhs: lhs, rhs: rhs) ?? 99.999
        }
        if operators.dequeueStack.isEmpty == false {
            operators.dequeueStack.removeAll()
        }
        print("lhs: \(lhs),   rhs: \(rhs)\n")
        return result
    }
}
