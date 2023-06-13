//
//  Formula.swift
//  Calculator
//
//  Created by hoon, hemg on 2023/06/06.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var partialResult = operands.dequeue() else {
            throw CalculatorError.missingOperand
        }
        
        while let operatorCase = operators.dequeue(),
              let nextOperand = operands.dequeue() {
           
            partialResult = operatorCase.calculate(lhs: partialResult, rhs: nextOperand)
        }
        
        return partialResult
    }
}
