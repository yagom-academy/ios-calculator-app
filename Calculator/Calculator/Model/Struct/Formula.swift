//
//  Formula.swift
//  Calculator
//
//  Created by dragon on 2022/09/23.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard let leftNumber = operands.dequeue() else { return 0.0 }
        guard let rightNumber = operands.dequeue() else { return 0.0 }
        guard let calculate = operators.dequeue() else { return 0.0 }
        
        let result = calculate.calculate(lhs: leftNumber, rhs: rightNumber)
        return result
    }
}
