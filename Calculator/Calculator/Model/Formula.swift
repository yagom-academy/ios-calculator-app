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
    private var temporaryResult: Double = Double()
    
    public mutating func result() -> Double? {
        guard let numberToCalculate = operands.dequeue() else {
            return nil
        }
        
        guard let operatorToCalculate = operators.dequeue() else {
            return nil
        }
        
        for _ in 0..<operators.count {
            temporaryResult = operatorToCalculate.calculate(lhs: numberToCalculate, rhs: numberToCalculate)
        }
        return temporaryResult
    }
}
