//
//  calculator.swift
//  Calculator
//
//  Created by 제임스,수킴,바비 on 2021/03/26.
//

import Foundation

class Divider {
    static let shardInstance = Divider()
    var userInput:[String] = []
    let operators = ["*","/","+","-"]
    
    private init() {}
    
    private func appendNewValue(_ presentValue: String, after justBeforeValue: String ) {
        if operators.contains(justBeforeValue) {
            userInput.append(presentValue)
        } else {
            userInput.popLast()
            userInput.append(justBeforeValue + presentValue)
        }
    }
    
    private func appendInitialValue(_ inputValue: String) {
        if operators.contains(inputValue) {
            userInput = []
        } else {
            userInput.append(inputValue)
        }
    }
    
    func transformInput(input: String) {
        if let lastUserInput = self.userInput.last {
            appendNewValue(input, after: lastUserInput)
        } else {
            appendInitialValue(input)
        }
    }
}

class Calculate {
    typealias weight = Int
    
    let operatorPriority: [String : weight] = ["*" : 3, "/" : 3, "+" : 2, "-" : 2, "(" : 1]
    let operators = ["*","/","+","-"]
//    var medianNotation: [String] = Divider.shardInstance.userInput
    var medianNotation: [String] = ["3","+","2","*","5","-","6","/","9","+"]
    var postfixNotation: [String] = []
    var operatorStack = Stack<String>()
    lazy var firstOperand = Double()
    lazy var secondOperand = Double()
    
    func calculatePostfixNotation() {
        var operandStack = Stack<Double>()
        
        for index in postfixNotation {
            if !operators.contains(index) {
                guard let index = Double(index) else { return }
                operandStack.push(index)
            } else {
                guard let firstPoppedValue = operandStack.pop() else { return }
                firstOperand = firstPoppedValue.value
                guard let secondPoppedValue = operandStack.pop() else { return }
                secondOperand = secondPoppedValue.value
                
                switch index {
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
                print(operatorStack.peek()?.value)
            }
            operatorStack.push(index)
            }
        }
    
    private func pushStack(index: String) {
        if operators.contains(index) {
            pushComparedOperator(index: index)
        } else {
            postfixNotation.append(index)
        }
    }
    
    func changeCalculate() {
        if operators.contains(medianNotation.last!) {
            medianNotation.popLast()
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
