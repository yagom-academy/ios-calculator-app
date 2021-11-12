//
//  Formula.swift
//  Calculator
//
//  Created by 양호준 on 2021/11/12.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>(),
         operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() throws -> Double {
        if operands.array == [] {
            operands.appendItem(0)
        }
        
        if operators.array == [] {
            throw QueueError.emptyArray
        }
        
        let firstOperand = operands.array[0]
        let firstOperator = operators.array[0]
        var result = 0.0
        
        do {
            let nextOperand = try operands.takeOutItem()
            if nextOperand == [] {
                throw QueueError.emptyArray
            }
            result = firstOperator.calculate(lhs: firstOperand, rhs: nextOperand[0])
        } catch {
            throw QueueError.emptyArray
        }
        
        while try operators.takeOutItem().isEmpty == false {
            do {
                let nextOperand = try operands.takeOutItem()
                let nextOperator = try operators.takeOutItem()
                if nextOperand == [] {
                    throw QueueError.emptyArray
                }
                if nextOperator == [] {
                    throw QueueError.emptyArray
                }
                result = nextOperator[0].calculate(lhs: result, rhs: nextOperand[0])
            } catch {
                throw QueueError.emptyArray
            }
        }
        
        return result
    }
}
