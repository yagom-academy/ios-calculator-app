//
//  Formula.swift
//  Calculator
//
//  Created by 유제민 on 2022/09/28.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = .init()
    var operators: CalculatorItemQueue<Operator> = .init()
    
    mutating func result() -> Double? {
        guard let firstOperand = operands.dequeue() else { return nil }
        var calculateResult: Double = firstOperand
        
        while operators.head?.next != nil {
            guard let operation = operators.dequeue(), let rhs = operands.dequeue() else { return nil }
            calculateResult = operation.calculate(lhs: firstOperand, rhs: rhs)
        }
        return calculateResult
    }
}
