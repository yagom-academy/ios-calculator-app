//
//  Formula.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/28.
//

import Foundation

struct Formula {
    let operandQueue: CalculatorQueue<Double>
    let opratorQueue: CalculatorQueue<Operator>
    
    func result() -> Double {
        var accumulationResult = operandQueue.dequeue() ?? .zero

        while let operatorElement = opratorQueue.dequeue(), let rhs = operandQueue.dequeue() {
            accumulationResult = operatorElement.calculate(lhs: accumulationResult, rhs: rhs)
        }
        return accumulationResult
    }
}
