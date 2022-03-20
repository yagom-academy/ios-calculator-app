//  Formula.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/20

import Foundation

struct Formula {
    let operands: CalculateItemQueue<Double>
    let operators: CalculateItemQueue<Operator>
    
    func result() throws -> Double {
        let operandsCount = operands.count
        guard var result = operands.dequeue else { return 0.0 }
        for _ in 2...operandsCount {
            guard let operandValue = operands.dequeue else { return 0.0 }
            guard let operatorValue = operators.dequeue else { return 0.0 }
            result = try operatorValue.calculate(lhs: result, rhs: operandValue)
        }
        return result
    }
}
