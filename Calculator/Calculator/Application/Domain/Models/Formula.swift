//
//  Formula.swift
//  Calculator
//
//  Created by 나이든별, 민쏜
//

struct Formula {
    let operands: CalculatorItemQueue<Double>
    let operators: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        var operands = self.operands
        var operators = self.operators
        
        guard var result = operands.dequeue() else {
            throw CalculatorError.noRemainingValue
        }
        
        while let nextOperator = operators.dequeue(),
              let nextOperand = operands.dequeue() {
            
            let newValue = try nextOperator.calculate(lhs: result, rhs: nextOperand)
            result = newValue
        }
        
        return result
    }
}
