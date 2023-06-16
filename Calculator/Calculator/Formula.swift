//
//  Formula.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/06.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() -> Double {
        guard var firstOperand = operands.dequeue() else {
            return 0
        }
        
        while
            let currentOperator = operators.dequeue(),
            let secondOperand = operands.dequeue()
        {
            firstOperand = currentOperator.calculate(lhs: firstOperand, rhs: secondOperand)
        }
        
        return firstOperand.isZero ? 0 : firstOperand
    }
}
