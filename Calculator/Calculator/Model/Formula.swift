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

    init(opreands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>(),
         operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()) {
        self.operands = opreands
        self.operators = operators
    }
    
    mutating func result() throws -> Double {
        guard let firstOperand = operands.dequeue() else {
            throw CalculatorError.queueNotFound
        }
        var currentOperand = firstOperand
        let canBeCalculated = (operands.isEmpty == false) && (operators.isEmpty == false)
        guard canBeCalculated else {
            throw CalculatorError.queueNotFound
        }
        repeat {
            guard let currentOperator = operators.dequeue() else {
                throw CalculatorError.wrongOperator
            }
            guard let rightOperand = operands.dequeue() else {
                throw CalculatorError.wrongOperand
            }
            currentOperand = currentOperator.calculate(lhs: currentOperand, rhs: rightOperand)
        } while operands.isEmpty == false
        if operators.isEmpty == false {
            operators.clear()
        }
        guard currentOperand.isNaN == false else {
            throw CalculatorError.notNumber
        }
        return currentOperand
    }
}
