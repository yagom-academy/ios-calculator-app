//
//  Calculator.swift
//  Calculator
//
//  Created by Kim Do hyung on 2021/06/22.
//

import Foundation

class Calculator {
    var infix: [Computable] = []
    
    func convertToPostFix() -> [Computable] {
        var postfix: [Computable] = []
        let operatorStack = Stack<Operator>()
        
        for character in infix {
            if let value = character as? Operand {
                postfix.append(value)
            } else if let value = character as? Operator {
                while !operatorStack.isEmpty(), let postfixItem = operatorStack.peek(), value < postfixItem {
                    postfix.append(postfixItem)
                    operatorStack.pop()
                }
                operatorStack.push(object: value)
            }
        }
        
        while let postfixItem = operatorStack.pop() {
            postfix.append(postfixItem)
        }
        
        return postfix
    }
    
    func evaluate(postfix: [Computable]) throws -> Operand? {
        let operandStack = Stack<Operand>()
        
        for postfixItem in postfix {
            if let operandValue = postfixItem as? Operand {
                operandStack.push(object: operandValue)
            } else if let operatorValue = postfixItem as? Operator,
                      let rhs = operandStack.pop(),
                      let lhs = operandStack.pop() {
                let result = try operatorValue.calculate(lhs, with: rhs)
                operandStack.push(object: Operand(operand: result))
            }
        }
        return operandStack.pop()
    }
    
    func pushToInfix(with inputNotation: [String]) {
        for value in inputNotation {
            if let operatorValue = Operator(rawValue: value) {
                infix.append(operatorValue)
            } else if let operandValue = Operand(operand: value) {
                infix.append(operandValue)
            }
        }
    }
}


