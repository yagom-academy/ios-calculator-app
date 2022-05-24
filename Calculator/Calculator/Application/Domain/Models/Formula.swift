//
//  Formula.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/19.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            throw CalculatorError.noRemainingValue
        }
        
        while let nextOperator = operators.dequeue(),
              let nextOperand = operands.dequeue() {
            do {
                let newValue = try nextOperator.calculate(lhs: result, rhs: nextOperand)
                result = newValue
            } catch {
                throw error
            }
        }
        
        return result
    }
}
