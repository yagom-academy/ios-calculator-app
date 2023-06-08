//
//  Formula.swift
//  Calculator
//
//  Created by EtialMoon on 2023/06/03.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        var result: Double?
        var lhs: Double?
        
        while !operators.isEmpty {
            (lhs == nil) ? (lhs = operands.dequeue()) : (lhs = result)
            
            guard let lhs,
                  let rhs = operands.dequeue(),
                  let operationResult = operators.dequeue()?.calculate(lhs: lhs, rhs: rhs) else {
                throw FormulaError.operationError
            }
            
            if operationResult.isInfinite || operationResult.isNaN {
                throw FormulaError.divideByZeroError
            }
            
            result = operationResult
        }
        
        guard let result else {
            throw FormulaError.operationError
        }
        
        return result
    }
}
