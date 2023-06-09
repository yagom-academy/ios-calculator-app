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
        var result: Double = 0.0
        guard var lhs: Double = operands.dequeue() else { throw CalculatorError.inValidCalculate }
        
        while operands.isEmpty == false {
            let dequeueOperator = operators.dequeue()
            
            guard let rhs = operands.dequeue(),
                  let calculatedValue = dequeueOperator?.calculate(lhs: lhs, rhs: rhs) else { throw CalculatorError.inValidCalculate }
            
            lhs = calculatedValue
            result = calculatedValue
        }
        return result
    }
}

