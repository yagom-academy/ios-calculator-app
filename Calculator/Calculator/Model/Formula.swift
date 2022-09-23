//
//  Formula.swift
//  Calculator
//
//  Created by junho lee on 2022/09/23.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() -> Double? {
        var result: Double?
        while !operators.isEmpty {
            guard let lhs: Double = result != nil ? result : operands.dequeue(),
                  let rhs: Double = operands.dequeue() else {
                return result
            }
            result = operators.dequeue()?.calculate(lhs: lhs, rhs: rhs)
        }
        return result
    }
}
