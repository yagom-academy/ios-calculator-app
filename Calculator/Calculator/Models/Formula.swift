//
//  Formula.swift
//  Calculator
//
//  Created by Kyo on 2022/09/22.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        guard let firstNumber = operands.dequeue() else { return 0.0 }
        var calculatorResult: Double = firstNumber
        
        while operators.count() > 0 {
            guard let rhs = operands.dequeue() else { return 0.0 }
            guard let operators = operators.dequeue() else { return 0.0 }
            calculatorResult = operators.calculator(lhs: calculatorResult, rhs: rhs)
        }
        
        return calculatorResult
    }
}
