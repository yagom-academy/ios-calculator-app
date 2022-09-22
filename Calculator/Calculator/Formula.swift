//
//  Formula.swift
//  Calculator
//
//  Created by Gundy on 2022/09/22.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var leftNumber = operands.dequeue() else {
            return Double.zero
        }
        while let rightNumber = operands.dequeue() {
            guard let operatorSign = operators.dequeue() else {
                throw FormulaError.invalidInput
            }
            leftNumber = operatorSign.calculate(lhs: leftNumber, rhs: rightNumber)
        }
        return leftNumber
    }
}
