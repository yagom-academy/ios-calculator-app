//
//  Formula.swift
//  Calculator
//
//  Created by 박종화 on 2023/06/02.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()

    mutating func result() throws -> Double {
        guard var result: Double = operands.dequeue() else { throw CalculationErrors.emptyError }
        
        while operators.isEmpty == false {
            var lhs = result
            guard let rhs: Double = operands.dequeue(),
                  let operation: Operator = operators.dequeue() else { throw CalculationErrors.emptyError }
            
            result = operation.calculate(lhs: lhs, rhs: rhs)
        }
        
        return result
    }
}
