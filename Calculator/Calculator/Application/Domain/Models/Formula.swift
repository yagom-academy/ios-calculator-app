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
            let newValue = nextOperator.calculate(lhs: result, rhs: nextOperand)
            switch newValue {
            case .success(let value):
                result = value
            case .failure(let error):
                throw error
            }
        }
        
        return result
    }
}
