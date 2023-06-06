//
//  Formula.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/06/07.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            throw OperationError.operandNotEnoughError
        }

        while let nextOperand = operands.dequeue() {
            guard let operatorsElement = operators.dequeue() else {
                throw OperationError.operatorNotEnoughError
            }
            
            result = try operatorsElement.calculate(lhs: result, rhs: nextOperand)
        }
        
        return result
    }
}
