//
//  Formula.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/17.
//

import Foundation

struct Formula {
    let operandQueue: CalculatorItemQueue<Double>
    let operatorQueue: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        guard var accumulationResult = operandQueue.dequeue() else {
            return 0
        }
        
        while !operandQueue.isEmpty {
            guard let operandElement = operandQueue.dequeue(),
                  let operatorElemnet = operatorQueue.dequeue() else {
                return 0
            }
            accumulationResult = try operatorElemnet.calculate(lhs: accumulationResult, rhs: operandElement)
        }
        return accumulationResult
    }
}
