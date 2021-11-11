//
//  Formula.swift
//  Calculator
//
//  Created by Ari on 2021/11/11.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    init() {
        self.operands = CalculatorItemQueue<Double>()
        self.operators = CalculatorItemQueue<Operator>()
    }
    
    init(opreands: CalculatorItemQueue<Double>,
         operators: CalculatorItemQueue<Operator>) {
        self.operands = opreands
        self.operators = operators
    }
    
    mutating func result() throws -> Double {
        guard let firstOperand = operands.dequeue() else {
            throw CalculatorError.queueNotFound
        }
        var currentOperand = firstOperand
        guard operands.isEmpty == false else {
            return 0
        }
        while operands.isEmpty == false {
            guard let currentOperator = operators.dequeue() else {
                throw CalculatorError.wrongOperator
            }
            guard let rightOperand = operands.dequeue() else {
                throw CalculatorError.wrongOperand
            }
            currentOperand = currentOperator.calculate(lhs: currentOperand, rhs: rightOperand)
        }
        if operators.isEmpty == false {
            operators.clear()
        }
        return currentOperand
    }
}
