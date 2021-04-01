//
//  calculator.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/26.
//

import Foundation

class GeneralCalculator {
    var operatorStack = Stack<String>()
    
    private func distinguishOperatorFromOperand(_ element: String, _ input: InputDataValidator) {
        if Operators.list.contains(element) {
            pushPriorOperator(element, input)
        }
        else {
            input.data.postfixNotation.append(element)
        }
    }
    
    private func pushPriorOperator(_ element: String, _ input : InputDataValidator) {
        if operatorStack.isEmpty() {
            operatorStack.push(element)
        }
        else {
            guard let peeked = operatorStack.peek() else { return }
            guard let incomingOperator = Operators(rawValue: element),
                  let stackedOperator = Operators(rawValue: peeked.value) else { return }
                  
            while incomingOperator.precedence < stackedOperator.precedence || incomingOperator.precedence == stackedOperator.precedence {
                guard let popped = operatorStack.pop() else { break }
                
                input.data.postfixNotation.append(popped.value)
            }
                operatorStack.push(element)
        }
    }
    
    private func appendRemainingOperators(_ input: InputDataValidator) {
        while !operatorStack.isEmpty() {
            guard let remainder = operatorStack.pop()?.value else { return }
            
            input.data.postfixNotation.append(remainder)
        }
    }
    
    func convertToPostfixNotation(_ input: InputDataValidator) {
        if Operators.list.contains(input.data.medianNotation.last!) {
            input.data.medianNotation.removeLast()
        }
        for element in input.data.medianNotation {
            distinguishOperatorFromOperand(element, input)
        }
        appendRemainingOperators(input)
    }
}

