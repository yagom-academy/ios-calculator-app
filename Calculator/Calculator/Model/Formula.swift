//
//  Formula.swift
//  Calculator
//
//  Created by 김성준 on 2023/01/27.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    mutating func result() -> Double? {
        guard var presentValue = operands.dequeue() else { return nil }
        while let nextValue = operands.dequeue() {
            guard let operatorSign = operators.dequeue() else { return nil }
            presentValue = operatorSign.calculate(lhs: presentValue, rhs: nextValue)
        }

        // presentValue 현재값
        // rightValue -> 계산할 값 : valueForCalculate
        return presentValue
    }
}
