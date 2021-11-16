//
//  Formula.swift
//  Calculator
//
//  Created by 양호준 on 2021/11/12.
//

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
        var `operator` = operators.items
        var result = firstOperand
        
        repeat {
            do {
                let nextOperand = try operands.removeItem()
                
                if nextOperand == [] {
                    throw QueueError.emptyOperandItem
                }
                
                result = `operator`[0].calculate(lhs: result, rhs: nextOperand[0])
            } catch {
                throw QueueError.emptyOperandItem
            }
            
            do {
                `operator` = try operators.removeItem()
            } catch {
                throw QueueError.emptyOperatorItem
            }
        } while `operator`.count >= 1
        
        return result
    }
}
