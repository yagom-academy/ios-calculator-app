//
//  Formula.swift
//  Calculator
//
//  Created by yyss99, Serena on 2023/06/07.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        while operators.count > 0 {
            guard let operatorValue = operators.dequeue() else {
                break
            }
            
            guard let lhs = operands.dequeue(), let rhs = operands.dequeue() else {
                break
            }
            
            let result = operatorValue.calculate(lhs: lhs, rhs: rhs)
            operands.enqueue(result)
        }
        
        return operands.dequeue() ?? 0.0
    }
}
