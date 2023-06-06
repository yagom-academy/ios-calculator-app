//
//  Formula.swift
//  Calculator
//
//  Created by Hemg on 2023/06/06.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        if let firstOperand = operands.dequeueItem() {
            operands.enqueue(item: firstOperand)
        }
        
        while !operators.isEmpty() {
            guard let operatorValue = operators.lastItem else { continue }
            guard let rhs = operands.dequeueItem() else { continue }
            guard let lhs = operands.dequeueItem() else { continue }
//            guard let operators = operators.dequeueItem() else { continue }
            
            let result = operatorValue.calculate(rhs, lhs)
            operands.enqueue(item: result)
        }
        
        
        return 0.0
    }
}
