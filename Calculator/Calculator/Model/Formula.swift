//  Formula.swift
//  Calculator
//  Created by LJ on 2022/09/22.

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() throws -> Double {
        var lhs = operands.dequeue() ?? 99.999
        var rhs = operands.dequeue() ?? 99.999
        var operatorsValue = operators.dequeue()
        var result: Double
        
        do {
            let tryResult = try operatorsValue?.calculate(lhs: lhs, rhs: rhs) ?? 99.999
            result = tryResult
        } catch {
            throw OccuredError.tryDivideZero
        }
        while !operands.dequeueStack.isEmpty {
            lhs = result
            rhs = operands.dequeue() ?? 99.999
            operatorsValue = operators.dequeue()
            do {
                let tryResult = try operatorsValue?.calculate(lhs: lhs, rhs: rhs) ?? 99.999
                result = tryResult
            } catch {
                throw OccuredError.tryDivideZero
            }
        }
        if operators.dequeueStack.isEmpty == false {
            operators.dequeueStack.removeAll()
        }
        
        return result
    }
}
