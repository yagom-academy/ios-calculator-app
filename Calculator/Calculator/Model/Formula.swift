//
//  Formula.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/06/07.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var accumulateValue = operands.dequeue() else {
            throw OperationError.operandNotEnoughError
        }

        while let nextOperand = operands.dequeue() {
            guard let operatorsElement = operators.dequeue() else {
                throw OperationError.operatorNotEnoughError
            }
            
            accumulateValue = try operatorsElement.calculate(lhs: accumulateValue, rhs: nextOperand)
        }
        
        return accumulateValue
    }
}
