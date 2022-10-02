//  Formula.swift
//  Calculator
//  Created by LJ on 2022/09/22.

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() throws -> Double? {
        
        guard let firstLhs: Double = operands.dequeue(),
              let firstRhs: Double = operands.dequeue() else {
            return nil
        }
        guard let firstOperatorsValue: Operator = operators.dequeue() else {
            throw OccuredError.emptyOperator
        }
        var result: Double? = firstOperatorsValue.calculate(lhs: firstLhs, rhs: firstRhs)
        
        while !operands.dequeueStack.isEmpty {
            guard let lhs: Double = result,
                  let rhs: Double = operands.dequeue() else {
                return nil
            }
            guard let operatorsValue: Operator = operators.dequeue() else {
                throw OccuredError.emptyOperator
            }
            result = operatorsValue.calculate(lhs: lhs, rhs: rhs)
        }
        if result == nil {
            throw OccuredError.emptyOperator
        }
        if operators.dequeueStack.isEmpty == false {
            operators.dequeueStack.removeAll()
        }
        return result
    }
}
