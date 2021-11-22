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
        if operands.items == [] {
            operands.appendItem(0)
        }
        
        if operators.items == [] {
            throw QueueError.emptyOperatorItem
        }
        
        let firstOperand = operands.items[0]
        var operatorItems = operators.items
        var result = firstOperand
        
        repeat {
            do {
                let nextOperand = try operands.removeItem()
                
                if nextOperand == [] {
                    throw QueueError.emptyOperandItem
                }
                
                result = try operatorItems[0].calculate(lhs: result, rhs: nextOperand[0])
            } catch {
                throw QueueError.emptyOperandItem
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
