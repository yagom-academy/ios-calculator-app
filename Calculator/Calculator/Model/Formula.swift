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
        if operands.items == [] {
            operands.appendItem(0)
        }
        
        if operators.items == [] {
            throw QueueError.emptyItem
        }
        
        let firstOperand = operands.items[0]
        let firstOperator = operators.items[0]
        var result = 0.0
        
        do {
            let nextOperand = try operands.removeItem()
            if nextOperand == [] {
                throw QueueError.emptyItem
            }
            result = firstOperator.calculate(lhs: firstOperand, rhs: nextOperand[0])
        } catch {
            throw QueueError.emptyItem
        }
        
        while try operators.removeItem().isEmpty == false {
            do {
                let nextOperand = try operands.removeItem()
                let nextOperator = operators.items
                if nextOperator == [] {
                    throw QueueError.emptyItem
                }
                result = nextOperator[0].calculate(lhs: result, rhs: nextOperand[0])
            } catch {
                throw QueueError.emptyItem
            }
        }
        
        return result
    }
}
