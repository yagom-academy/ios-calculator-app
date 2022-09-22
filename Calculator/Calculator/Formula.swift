//  Formula.swift
//  Calculator
//  Created by LJ on 2022/09/22.

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() -> Double {
        operands.enqueue(element: 100.0)
        operands.enqueue(element: 200.0)
        operands.enqueue(element: 300.0)
        operators.enqueue(element: .add)
        operators.enqueue(element: .add)
        
        let operatorsValue = operators.dequeue()
        let lhs = operands.dequeue() ?? 99.999
        let rhs = operands.dequeue() ?? 99.999
        let result = operatorsValue?.calculate(lhs: lhs, rhs: rhs) ?? 99.999
        print(result)
        return result
    }
}
