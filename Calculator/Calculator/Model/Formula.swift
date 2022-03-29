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
    
    public mutating func result() throws -> Double? {
        guard var calculatedNumber = operands.dequeue() else { return nil }
        
        for _ in 0..<operators.count {
            guard let numberToCalculate = operands.dequeue() else { return nil }
            
            guard let operatorToCalculate = operators.dequeue() else { return nil }
            
            if operatorToCalculate == Operator.division && numberToCalculate == 0 {
                throw CalculatorError.divisionByZero
            } else {
                calculatedNumber = operatorToCalculate.calculate(lhs: calculatedNumber, rhs: numberToCalculate)
            }
        }
        
        return calculatedNumber
    }
}
