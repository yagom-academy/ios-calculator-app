//
//  calculator.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/26.
//

import Foundation

class Data {
    static var medianNotation: [String] = []
    static var postfixNotation: [String] = []
}

class GeneralCalculator {
    var decimalCalcualtion = DecimalCalculation()
    var binaryCalculation = BinaryCalculation()
    var operatorStack = Stack<String>()
    
    private func distinguishOperatorFromOperand(_ element: String) {
        if Operators.list.contains(element) {
            pushPriorOperator(element)
        }
        else {
            Data.postfixNotation.append(element)
        }
    }
    
    private func pushPriorOperator(_ element: String) {
        if operatorStack.isEmpty() {
            operatorStack.push(element)
        }
        else {
            guard let peeked = operatorStack.peek() else { return }
            guard let incomingOperator = Operators(rawValue: element),
                  let stackedOperator = Operators(rawValue: peeked.value) else { return }
                  
            while incomingOperator.precedence < stackedOperator.precedence || incomingOperator.precedence == stackedOperator.precedence {
                guard let popped = operatorStack.pop() else { break }
                
                Data.postfixNotation.append(popped.value)
            }
                operatorStack.push(element)
        }
    }
    
    private func appendRemainingOperators() {
        while !operatorStack.isEmpty() {
            guard let remainder = operatorStack.pop()?.value else { return }
            
            Data.postfixNotation.append(remainder)
        }
    }
    
    func executeDecimalCalculation() {
        if Operators.list.contains(Data.medianNotation.last!) {
            Data.medianNotation.removeLast()
        }
        for element in Data.medianNotation {
            distinguishOperatorFromOperand(element)
        }
        appendRemainingOperators()
        decimalCalcualtion.calculatePostfixNotation()
    }
    
    func executeBinaryCalculation() {
        if Operators.list.contains(Data.medianNotation.last!) {
            Data.medianNotation.removeLast()
        }
        for element in Data.medianNotation {
            distinguishOperatorFromOperand(element)
        }
        appendRemainingOperators()
        binaryCalculation.calculatePostfixNotation()
    }
}

