//
//  Formula.swift
//  Calculator
//
//  Created by idinaloq on 2023/06/02.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard let firstLhs: Double = operands.dequeue() else {
            return 0
        }
        
        var result: Double = firstLhs
        var lhs: Double = 0
        
        while let rhs: Double = operands.dequeue(),
              let operation: Operator = operators.dequeue() {
            lhs = result
            result = operation.calculate(lhs: lhs, rhs: rhs)
        }
        
        return result
    }
}
