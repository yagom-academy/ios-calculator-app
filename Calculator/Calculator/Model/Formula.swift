//
//  Formula.swift
//  Calculator
//
//  Created by marisol on 2022/03/18.
//

import Foundation

struct Formula {
    public var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    public var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    public mutating func result() -> Double? {
        guard var temporaryResult = operands.dequeue() else {
            return nil
        }
        
        for _ in 0..<operators.count {
            guard let rhs = operands.dequeue() else {
                return nil
            }
            
            guard let operatorToCalculate = operators.dequeue() else {
                return nil
            }
            
            temporaryResult = operatorToCalculate.calculate(lhs: temporaryResult, rhs: rhs)
        }
        return temporaryResult
    }
}
