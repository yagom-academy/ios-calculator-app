//
//  Formula.swift
//  Calculator
//
//  Created by Hemg on 2023/06/06.
//

struct Formula {
    let operands: CalculatorItemQueue<Double>
    let operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        guard let firstOperand = operands.dequeueItem() else {
            return 0.0
        }
        
        var result = firstOperand
        
        while !operators.isEmpty() {
            guard let operatorValue = operators.dequeueItem() else { continue }
            guard let nextOperand = operands.dequeueItem() else { continue }

            result = operatorValue.calculate(result, nextOperand)
        }
        
        return result
    }
}
