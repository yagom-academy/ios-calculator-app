//
//  Formula.swift
//  Calculator
//
//  Created by Kay on 2022/05/20.
//

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>

    mutating func result() -> Double {
        var calculationResult: Double = operands.dequeue() ?? 0.0
        
        while operators.count != 0 {
            guard let currentOperator = operators.dequeue() else { return 0.0}
            calculationResult = currentOperator.calculate(lhs: calculationResult, rhs: operands.dequeue() ?? 0.0)
        }
        return calculationResult
    }
}
