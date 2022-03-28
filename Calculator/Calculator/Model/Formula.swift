//
//  Formula.swift
//  Calculator
//
//  Created by Eddy on 2022/03/20.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    private func result() throws -> Double {
        guard var resultOperand = operands.dequeue() else {
            return 0
        }
        
        while !operands.isEmpty {
            guard let elementOperand = operands.dequeue(), let elementOperator = operators.dequeue() else {
                return 0
            }
            resultOperand = elementOperator.calculate(lhs: resultOperand, rhs: elementOperand)
        }
        return resultOperand
    }
}
