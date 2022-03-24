//  Formula.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/20

import Foundation

struct Formula {
    let operands: CalculateItemQueue<Double>
    let operators: CalculateItemQueue<Operator>
    
    func result() throws -> Double {
        guard operands.count >= 2 && operators.isEmpty == false else {
            throw CalculateError.cannotCalculation
        }
        guard var firstOperand = operands.dequeue() else {
            throw CalculateError.operandIsNil
        }
        while operands.isEmpty == false {
            guard let operandValue = operands.dequeue() else {
                throw CalculateError.operandIsNil
            }
            guard let operatorValue = operators.dequeue() else {
                throw CalculateError.operatorIsNil
            }
            firstOperand = try operatorValue.calculate(lhs: firstOperand, rhs: operandValue)
        }
        return firstOperand
    }
}
