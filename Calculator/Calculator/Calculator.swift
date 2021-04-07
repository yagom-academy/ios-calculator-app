//
//  calculator.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/26.
//

import Foundation

class Calculator {
    var operatorStack = Stack<String>()
    
    private func distinguishOperatorFromOperand(_ element: String, _ input: inout Data) {
        if Operators.list.contains(element) {
            pushPriorOperator(element, &input)
        }
        else {
            input.postfixNotation.append(element)
        }
    }
    
    private func pushPriorOperator(_ element: String, _ input : inout Data) {
        if operatorStack.isEmpty() {
            operatorStack.push(element)
        }
        else {
            guard let peeked = operatorStack.peek() else { return }
            guard let incomingOperator = Operators(rawValue: element),
                  let stackedOperator = Operators(rawValue: peeked.value) else { return }
                  
            while incomingOperator.precedence < stackedOperator.precedence || incomingOperator.precedence == stackedOperator.precedence {
                guard let popped = operatorStack.pop() else { break }
                
                input.postfixNotation.append(popped.value)
            }
                operatorStack.push(element)
        }
    }
    
    private func appendRemainingOperators(_ input: inout Data) {
        while !operatorStack.isEmpty() {
            guard let remainder = operatorStack.pop()?.value else { return }
            
            input.postfixNotation.append(remainder)
        }
    }
    
    func convertToPostfixNotation(_ input: inout Data) {
        if Operators.list.contains(input.medianNotation.last!) {
            input.medianNotation.removeLast()
        }
        for element in input.medianNotation {
            distinguishOperatorFromOperand(element, &input)
        }
        appendRemainingOperators(&input)
    }
}

