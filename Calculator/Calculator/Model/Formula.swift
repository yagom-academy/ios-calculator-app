//
//  Formula.swift
//  Calculator
//
//  Created by yyss99, Serena on 2023/06/07.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result: Double = 0.0
        var lhs: Double?
        
        if operators.isEmpty,
           let operandValue = operands.dequeue() {
            return operandValue
        }
        
        while !operators.isEmpty {
            (lhs == nil) ? (lhs = operands.dequeue()) : (lhs = result)

            guard let lhs,
                  let rhs = operands.dequeue(),
                  let calculationOperator = operators.dequeue() else {
                return 0.0
            }

            result = calculationOperator.calculate(lhs: lhs, rhs: rhs)

            guard result != Double.nan && result != Double.infinity else {
                return 0.0
            }
        }

        return result
    }
}
