//
//  Formula.swift
//  Calculator
//
//  Created by Toy on 10/9/23.
//


struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        guard var firstOperands = operands.dequeue() else { throw CalculatorError.noValue }
        
        while let nextOperand = operands.dequeue(), let `operator` = operators.dequeue() {
            firstOperands = `operator`.calculate(lhs: firstOperands, rhs: nextOperand)
        }
        
        return firstOperands
    }
}
