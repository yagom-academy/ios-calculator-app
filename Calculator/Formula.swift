//
//  Formula.swift
//  Calculator
//
//  Created by Yetti on 2023/06/09.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() throws -> Double {
        guard var result: Double = operands.dequeue() else { throw CalculatorError.inValidCalculate }
        
        while let rhs = operands.dequeue(), let `operator` = operators.dequeue() {
            let calculatedValue = `operator`.calculate(lhs: result, rhs: rhs)
        
            result = calculatedValue
        }
        return result
    }
}
