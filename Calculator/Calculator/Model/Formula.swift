//  Formula.swift
//  Created by 레옹아범 on 2023/01/26.

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard var lhs: Double = operands.dequeue() else { return 0.0 }
        while let rhs = operands.dequeue() {
            guard let formula = operators.dequeue() else { return lhs }
            lhs = formula.calculate(lhs: lhs, rhs: rhs)
        }
        return lhs
    }
}
