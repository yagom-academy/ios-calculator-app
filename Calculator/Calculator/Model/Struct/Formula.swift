//
//  Formula.swift
//  Calculator
//
//  Created by dragon on 2022/09/23.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            throw CalculatorError.emptyNumber
        }
        
        while operands.isEmpty() == false && operators.isEmpty() == false {
            guard let number = operands.dequeue() else {
                throw CalculatorError.noMoreNumber
            }
            guard let element = operators.dequeue() else {
                throw CalculatorError.emptyElement
            }
            
            result = element.calculate(lhs: result, rhs: number)
        }
            
        return result
    }
}
