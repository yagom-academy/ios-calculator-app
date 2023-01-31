//
//  Formula.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/27.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard var lhs = operands.dequeue() else {
            return .zero
        }
        while operators.isEmpty == false {
            guard let operateSymbol = operators.dequeue(),
                  let rhs = operands.dequeue() else { return lhs }
            lhs = operateSymbol.calculate(lhs: lhs, rhs: rhs)
        }
        return lhs
    }
}
