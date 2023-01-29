//
//  Formula.swift
//  Calculator
//
//  Created by 김성준 on 2023/01/27.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    mutating func result() -> Double {
        guard var leftValue = operands.dequeue() else { return .nan }
        while let rightValue = operands.dequeue() {
            guard let operatorSign = operators.dequeue() else { return .nan }
            leftValue = operatorSign.calculate(lhs: leftValue, rhs: rightValue)
        }

        return leftValue
    }
}
