//
//  Formula.swift
//  Calculator
//
//  Created by mireu on 2023/10/06.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else { return 0 }
        
        while let nextOperand = operands.dequeue(), let operatorSign = operators.dequeue() {
            
            result = operatorSign.calculate(lhs: result, rhs: nextOperand)
        }
        
        return result
    }
}


