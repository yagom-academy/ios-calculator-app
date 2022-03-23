//  Formula.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/20

import Foundation

struct Formula {
    let operands: CalculateItemQueue<Double>
    let operators: CalculateItemQueue<Operator>
    
    func result() throws -> Double {
        let operandsRangeCount = 2...operands.count
        guard operands.count > 2 || operators.isEmpty else {
            throw CalculateError.cannotCalculation
        }
        guard var result = operands.dequeue else {
            throw CalculateError.operandIsNil
        }
        for _ in operandsRangeCount {
            guard let operandValue = operands.dequeue else {
                throw CalculateError.operandIsNil
            }
            guard let operatorValue = operators.dequeue else {
                throw CalculateError.operatorIsNil
            }
            result = try operatorValue.calculate(lhs: result, rhs: operandValue)
        }
        return result
    }
}
