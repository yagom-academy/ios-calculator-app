//  Formula.swift
//  Created by 레옹아범 on 2023/01/26.

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard var resultValue: Double = operands.dequeue() else { return 0.0 }
        while let rhs = operands.dequeue(),
              let operatorSymbol = operators.dequeue() {
            resultValue = operatorSymbol.calculate(lhs: resultValue, rhs: rhs)
        }
        return resultValue
    }
}
