//
//  calculator.swift
//  Calculator
//
//  Created by 제임스,수킴,바비 on 2021/03/26.
//

import Foundation

class InputDataValidation {
    static let sharedInstance = InputDataValidation()
    var userInput:[String] = []
    let operators = ["*","/","+","-"]
    
    private init() {}
    
    private func appendAdditionalValue(_ currentValue: String, after previousValue: String ) {
        if operators.contains(previousValue) {
            if operators.contains(currentValue){
                userInput.removeLast()
                userInput.append(currentValue)
            } else {
                userInput.append(currentValue)
            }
        } else {
            if operators.contains(currentValue) {
                userInput.append(currentValue)
            } else {
                userInput.removeLast()
                userInput.append(previousValue + currentValue)
            }
        }
    }
    
    private func appendInitialValue(_ inputValue: String) {
        if operators.contains(inputValue) {
            userInput = []
        } else {
            userInput.append(inputValue)
        }
    }
    
    func convertInput(input: String) {
        if let lastUserInput = userInput.last {
            appendAdditionalValue(input, after: lastUserInput)
        } else {
            appendInitialValue(input)
        }
    }
}

protocol Calculatable {
    
}

class PostfixCalculation {
    typealias precedence = Int
    
    let operatorPriority: [String : precedence] = ["*" : 3, "/" : 3, "+" : 2, "-" : 2, "(" : 1]
    var medianNotation: [String] = InputDataValidation.sharedInstance.userInput
    var postfixNotation: [String] = []
    var operatorStack = Stack<String>()
    var firstOperand = Double()
    var secondOperand = Double()
    
    func calculatePostfixNotation() {
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
                    operandStack.push(Double(secondOperand * firstOperand))
                case "/" :
                    operandStack.push(Double(secondOperand / firstOperand))
                case "+" :
                    operandStack.push(Double(secondOperand + firstOperand))
                case "-" :
                    operandStack.push(Double(secondOperand - firstOperand))
                default:
                    return
                }
            }
        }
        print(operandStack.peek()?.value)
    }
    
    private func pushComparedOperator(index: String) {
        if operatorStack.isEmpty() {
            operatorStack.push(index)
        } else {
            guard let peeked = operatorStack.peek() else { return }
            while operatorPriority[peeked.value]! >= operatorPriority[index]! {
                guard let popped = operatorStack.pop() else { break }
                postfixNotation.append(popped.value)
            }
            operatorStack.push(index)
            }
        }
    
    private func pushStack(index: String) {
        if operatorPriority.keys.contains(index) {
            pushComparedOperator(index: index)
        } else {
            postfixNotation.append(index)
        }
    }
    
    func changeCalculate() {
        if operatorPriority.keys.contains(medianNotation.last!) {
            medianNotation.removeLast()
        }
        for index in medianNotation {
            pushStack(index: index)
        }
        clearStack()
        calculatePostfixNotation()
    }
    
    private func clearStack() {
        while !operatorStack.isEmpty() {
            if let remainder = operatorStack.pop()?.value {
                postfixNotation.append(remainder)
            } else {
                break
            }
        }
    }
}
