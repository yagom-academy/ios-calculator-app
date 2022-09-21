//
//  Formula.swift
//  Calculator
//
//  Created by jin on 9/21/22.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        guard var lhsNum = operands.dequeue() else { return 0 }
        while !operands.isEmpty() {
            guard let rhsNum = operands.dequeue() else { return 0 }
            lhsNum = operators.dequeue()?.calculate(lhs: lhsNum, rhs: rhsNum) ?? 0
        }
        return lhsNum
    }
}
