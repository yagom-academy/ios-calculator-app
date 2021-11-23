//
//  Formula.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        if operands.items.isEmpty {
            operands.appendItem(0)
        }
        
        if operators.items.isEmpty {
            throw QueueError.emptyOperatorItem
        }
        
        guard let firstOperand = operands.items.first else {
            throw QueueError.emptyOperandItem
        }
        var operatorItems = operators.items
        var result = firstOperand
        
        repeat {
            do {
                let operandsItems = try operands.removeItem()
                
                guard let nextOperand = operandsItems.first else {
                    throw QueueError.emptyOperandItem
                }
                
                guard let `operator` = operatorItems.first else {
                    throw QueueError.emptyOperatorItem
                }
                
                result = try `operator`.calculate(lhs: result, rhs: nextOperand)
            } catch let error {
                throw error
            }
            
            do {
                operatorItems = try operators.removeItem()
            } catch {
                throw QueueError.emptyOperatorItem
            }
        } while operatorItems.count >= 1
        
        return result
    }
}
