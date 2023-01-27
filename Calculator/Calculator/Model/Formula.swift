//  Formula.swift
//  Created by 레옹아범 on 2023/01/26.

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard let lhs = operands.dequeue(),
              let rhs = operands.dequeue(),
              let formula = operators.dequeue() else { return 0.0 }
        return formula.calculate(lhs: lhs, rhs: rhs)
    }
}
