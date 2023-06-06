//
//  Formula.swift
//  Calculator
//
//  Created by EtialMoon on 2023/06/03.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>(enqueuedCalculatorItems: [Operator.add])
    
    mutating func result() throws -> Double {
        var operationCount = operators.count()
        var result = 0.0
        
        while operationCount > 0 {
            guard let operand = operands.dequeue(),
                  let operationResult = operators.dequeue()?.calculate(lhs: result, rhs: operand) else {
                throw FormulaError.operationError
            }
            
            if operationResult.isInfinite {
                throw FormulaError.divideByZeroError
            }
            
            result = operationResult
            operationCount -= 1
        }
        
        return result
    }
}
