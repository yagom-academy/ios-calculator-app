//
//  calculator.swift
//  Calculator
//
//  Created by 제임스,수킴,바비 on 2021/03/26.
//

import Foundation

class DecimalInputDataValidation: InputDataValidationProtocol{
    static let sharedInstance = DecimalInputDataValidation()
    var userInput:[String] = []
    let operators = ["*","/","+","-"]
    
    private init() {}
    
    private func filterAdditionalIncomingData(_ currentData: String, after previousData: String ) {
        switch operators.contains(previousData) {
        case true :
            if operators.contains(currentData){
                userInput.removeLast()
                userInput.append(currentData)
            } else {
                userInput.append(currentData)
            }
        case false :
            if operators.contains(currentData) {
                userInput.append(currentData)
            } else {
                userInput.removeLast()
                userInput.append(previousData + currentData)
            }
        }
    }
    
    private func filterInitialIncomingData(_ inputData: String) {
        if operators.contains(inputData) {
            userInput = []
        } else {
            userInput.append(inputData)
        }
    }
    
    func manageData(input: String) {
        if userInput.isEmpty {
            filterInitialIncomingData(input)
        }
        else {
            guard let finalElement = userInput.last else { return }
            filterAdditionalIncomingData(input, after: finalElement)
        }
    }
}

class DecimalCalculation: CalculationProtocol{
    typealias precedence = Int
    
    let operatorPriority: [String : precedence] = ["*" : 3, "/" : 3, "+" : 2, "-" : 2, "(" : 1]
    var medianNotation: [String] = DecimalInputDataValidation.sharedInstance.userInput
    var postfixNotation: [String] = []
    var operatorStack = Stack<String>()
    var firstOperand = Double()
    var secondOperand = Double()
    
    
    func convertToPostfixNotation() {
        if operatorPriority.keys.contains(medianNotation.last!) {
            medianNotation.removeLast()
        }
        for element in medianNotation {
            distinguishOperatorFromOperand(element)
        }
        appendRemainingOperators()
        calculatePostfixNotation()
    }
    
    private func calculatePostfixNotation() {
        var operandStack = Stack<Double>()
        
        for element in postfixNotation {
            if !operatorPriority.keys.contains(element) {
                guard let numbers = Double(element) else { return }
                operandStack.push(numbers)
            } else {
                guard let firstPoppedValue = operandStack.pop(),
                      let secondPoppedValue = operandStack.pop() else { return }
                firstOperand = firstPoppedValue.value
                secondOperand = secondPoppedValue.value
                
                switch element {
                case "*" :
                    operandStack.push(secondOperand * firstOperand)
                case "/" :
                    operandStack.push(secondOperand / firstOperand)
                case "+" :
                    operandStack.push(secondOperand + firstOperand)
                case "-" :
                    operandStack.push(secondOperand - firstOperand)
                default:
                    return
                }
            }
        }
        print(operandStack.peek()?.value)
    }
    
    private func distinguishOperatorFromOperand(_ element: String) {
        if operatorPriority.keys.contains(element) {
            pushPriorOperator(element)
        } else {
            postfixNotation.append(element)
        }
    }
    
    private func pushPriorOperator(_ element: String) {
        if operatorStack.isEmpty() {
            operatorStack.push(element)
        } else {
            guard let peeked = operatorStack.peek() else { return }
            while operatorPriority[peeked.value]! >= operatorPriority[element]! {
                guard let popped = operatorStack.pop() else { break }
                postfixNotation.append(popped.value)
            }
            operatorStack.push(element)
        }
    }
    
    private func appendRemainingOperators() {
        while !operatorStack.isEmpty() {
            if let remainder = operatorStack.pop()?.value {
                postfixNotation.append(remainder)
            }
            break
        }
    }
}
