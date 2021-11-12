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
    
    func result() throws -> Double {
        let firstNumber = try operands.dequeue()

        var result: Double = firstNumber

        while operands.isEmpty == false {
            let `operator` = try operators.dequeue()
            let number = try operands.dequeue()

            result = `operator`.calculate(lhs: result, rhs: number)
        }
         
        return result
    }
}
