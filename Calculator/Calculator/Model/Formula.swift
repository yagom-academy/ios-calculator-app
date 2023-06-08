//
//  Formula.swift
//  Calculator
//
//  Created by Hemg on 2023/06/06.
//

struct Formula {
    let operands: CalculatorItemQueue<Double>
    let operators: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        guard let firstOperand = operands.dequeueItem() else {
            throw CalculatorError.missingOperand
        }
        
        var result = firstOperand
        
        while let operatorValue = operators.dequeueItem(), let nextOperand = operands.dequeueItem() {

            result = operatorValue.calculate(result, nextOperand)
        }
        
        return result
    }
}
