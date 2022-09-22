//
//  Formula.swift
//  Calculator
//
//  Created by mene on 22/9/2022.
//

struct Formula {
    
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result: Double = 0
        
        guard let firstNumber = operands.dequeue(),
              let secondNumber = operands.dequeue(),
              let operatorSymbol = operators.dequeue() else {
            return 0
        }
        result =  operatorSymbol.calculate(lhs: firstNumber, rhs: secondNumber)
        
        while operands.count >= 1 {
            guard let nextNumber = operands.dequeue(),
                  let nextOperatorSymbol = operators.dequeue() else {
                return 0
            }
            result = nextOperatorSymbol.calculate(lhs: result, rhs: nextNumber)
        }
        return result
    }
}

