//
//  Formula.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        
        guard let lhs = operands.dequeue() else { throw CalculationError.notFoundOperand }
        guard let rhs = operands.dequeue() else { throw CalculationError.notFoundOperand }
        guard let `operator` = operators.dequeue() else { throw CalculationError.notFoundOperator }
        
        var result = try `operator`.calculate(lhs: lhs, rhs: rhs)
        
        while let next = operands.dequeue() {
            guard let `operator` = operators.dequeue() else { throw CalculationError.notFoundOperator }
            result = try `operator`.calculate(lhs: result, rhs: next)
        }
        
        return result
    }
}
