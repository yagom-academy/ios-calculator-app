//
//  Formula.swift
//  Calculator
//
//  Created by 혜모리, 릴라 on 2023/01/28.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    func result() -> Double {
        var presentValue: Double = operands.dequeue()?.value ?? 0
        
        while let nextValue = operands.dequeue()?.value {
            guard let operatorValue = self.operators.dequeue()?.value else { break }
            presentValue = operatorValue.calculate(lhs: presentValue, rhs: nextValue)
        }
        return presentValue
    }
}
