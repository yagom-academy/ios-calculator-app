//
//  Formula.swift
//  Calculator
//
//  Created by 황제하 on 2021/11/11.
//

import Foundation

struct Formula {
    let operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    let operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    func result() -> Double {
        guard let firstNumber = operands.dequeue() else {
            return 0
        }

        var result: Double = firstNumber

        while operands.isEmpty == false {
            guard let `operator` = operators.dequeue() else {
                return 0
            }
            guard let number = operands.dequeue() else {
                return 0
            }

            result = `operator`.calculate(lhs: result, rhs: number)
        }
        
        return result
    }
}
