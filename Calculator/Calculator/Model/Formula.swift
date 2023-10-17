//
//  Formula.swift
//  Calculator
//
//  Created by Kiseok on 2023/10/11.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard var lhs = operands.dequeue() else {
            return .zero
        }
        
        while let operatorSymbol = operators.dequeue() {
            guard let rhs = operands.dequeue() else {
                return operatorSymbol.calculate(lhs: lhs, rhs: lhs)
            }
            
            lhs = operatorSymbol.calculate(lhs: lhs, rhs: rhs)
        }
        
        return lhs
    }
}
