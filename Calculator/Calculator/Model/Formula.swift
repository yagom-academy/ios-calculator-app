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
        guard var result: Double = operands.dequeue() else {
            throw CalculatorItemQueueError.noneElement
        }
        
        while !operands.isEmpty {
            guard let rhs = operands.dequeue(),
                  let operationResult = operators.dequeue()?.calculate(lhs: result, rhs: rhs) else {
                throw FormulaError.operationFailure
            }
            
            if operationResult.isInfinite || operationResult.isNaN {
                throw FormulaError.divideByZero
            }
            
            result = operationResult
        }
        
        return result
    }
}
