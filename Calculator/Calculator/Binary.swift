//
//  Binary.swift
//  Calculator
//
//  Created by 제임스,수킴,바비 on 2021/03/27.
//

import Foundation

class BinaryInputDataValidation: InputDataValidationProtocol{
    static let sharedInstance = BinaryInputDataValidation()
    var userInput:[String] = []
    let operators = ["&", "~&", "|", "~|", "^", "~", ">>", "<<", "+", "-"]
    
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
        if inputData == "~" || !operators.contains(inputData) {
            userInput.append(inputData)
        } else {
            userInput = []
        }
    }
    
    func manageData(input: String) {
        if userInput.isEmpty {
            filterInitialIncomingData(input)
        }
        guard let finalElement = userInput.last else { return }
        filterAdditionalIncomingData(input, after: finalElement)
    }
}

class BinaryCalculation: CalculationProtocol {
    typealias precedence = Int
    
    let operatorPriority: [String : precedence] =
        [">>" : 4, "<<" : 4 ,"&" : 3, "~&" : 3, "|" : 2, "~|" : 2, "^" : 2, "+" : 2, "-" : 2, "~" : 1]
    let customOperatorGruop: [String] = ["~&", "~|"]
    var medianNotation: [String] = BinaryInputDataValidation.sharedInstance.userInput
    var postfixNotation: [String] = []
    var operatorStack = Stack<String>()
    var firstOperand = Int()
    var secondOperand = Int()
    
    func convertToPostfixNotation() {
        guard let lastElement = medianNotation.last else { return }
        if lastElement == "~" || !operatorPriority.keys.contains(lastElement) {
            for index in medianNotation {
                distinguishOperatorFromOperand(index)
            }
        } else {
            medianNotation.removeLast()
        }
        appendRemainingOperators()
        calculatePostfixNotation()
    }
    
    func pad(string : String, toSize: Int) -> String {
        var padded = string
        for _ in 0..<(toSize - string.count) {
            padded = "0" + padded
        }
        return padded
    }
    
    private func calculatePostfixNotation() {
        var operandStack = Stack<Int>()
        
        for element in postfixNotation {
            if !operatorPriority.keys.contains(element) {
                guard let numbers = Int(element) else { return }
                operandStack.push(numbers)
            }
            else if element == "~" {
                guard let firstPoppedValue = operandStack.pop() else { return }
                firstOperand = firstPoppedValue.value
                let binaryNumber = UInt8((firstOperand))
                let resultNumber = Int(~binaryNumber)
                operandStack.push(resultNumber)
            }
            else if customOperatorGruop.contains(element) {
                guard let firstPoppedValue = operandStack.pop(), let secondPoppedValue = operandStack.pop() else { return }
                firstOperand = firstPoppedValue.value
                secondOperand = secondPoppedValue.value
                let firstBinaryNumber = UInt8(firstOperand)
                let secondBinaryNumber = UInt8(secondOperand)
                
                switch element {
                case "~&" :
                    operandStack.push(Int(firstBinaryNumber ~& secondBinaryNumber))
                case "~|" :
                    operandStack.push(Int(firstBinaryNumber ~| secondBinaryNumber))
                default :
                    return
                }
            }
            else {
                guard let firstPoppedValue = operandStack.pop(), let secondPoppedValue = operandStack.pop() else { return }
                firstOperand = firstPoppedValue.value
                secondOperand = secondPoppedValue.value
                switch element {
                case ">>" :
                    operandStack.push(firstOperand >> secondOperand)
                case "<<" :
                    operandStack.push(firstOperand << secondOperand)
                case "&" :
                    operandStack.push(secondOperand & firstOperand)
                case "|" :
                    operandStack.push(secondOperand | firstOperand)
                case "^" :
                    operandStack.push(secondOperand ^ firstOperand)
                case "+" :
                    operandStack.push(secondOperand + firstOperand)
                case "-" :
                    operandStack.push(secondOperand - firstOperand)
                default:
                    return
                }
            }
        }
        guard let result = operandStack.peek() else { return }
        let binaryNumber = String(result.value, radix: 2)
        print(pad(string: binaryNumber, toSize: 8))
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

