//
//  Formula.swift
//  Calculator
//
//  Created by Kyo on 2022/09/22.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        guard let firstNumber = operands.dequeue() else { throw CalculatorError.noneOperand }
        var calculatorResult: Double = firstNumber
        
        while operators.count() > 0 {
            guard let secondNumber = operands.dequeue() else { throw CalculatorError.noneOperand }
            guard let operators = operators.dequeue() else { throw CalculatorError.noneOperator }
            calculatorResult = operators.calculator(lhs: calculatorResult, rhs: secondNumber)
        }
        
        return calculatorResult
    }
}
