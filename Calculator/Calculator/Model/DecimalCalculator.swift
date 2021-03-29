//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by 이영우 on 2021/03/22.
//

import Foundation

final class DecimalCalculator: DecimalCalculatable {
    static let shared = DecimalCalculator()
    
    var stack: Stack = Stack()
    var postfix = [String]()
    var numberInput = Constant.blank
    let operatorArray = OperatorType.allCases.map{ $0.rawValue }
    
    private init() { }

    func input(_ input: String) {
        if !operatorArray.contains(input) {
            numberInput = numberInput + input
        } else if input == OperatorType.equal.symbol {
            numberMoveToArray()
            for _ in Constant.zero..<stack.count {
                guard let stackTopOperator = stack.pop() else { return }
                calculate(using: stackTopOperator)
            }
        } else {
            numberMoveToArray()
            calculateHigherPrioritythan(input)
            pushOperatorInStack(input)
        }
    }
    
    func infixCalculate(firstNumber: Double, operatorSymbol: String, secondNumber: Double) -> String {
        var result = Constant.doubleZero
        let error: Error = CalculatorError.invalidOperator
        
        switch operatorSymbol {
        case OperatorType.subtract.symbol:
            result = secondNumber - firstNumber
        case OperatorType.add.symbol:
            result = secondNumber + firstNumber
        case OperatorType.multiple.symbol:
            result = secondNumber * firstNumber
        case OperatorType.divide.symbol:
            result = secondNumber / firstNumber
        default:
            print(error.localizedDescription)
            fatalError()
        }
        return String(result)
    }
    
    func numberMoveToArray() {
        postfix.append(numberInput)
        numberInput = Constant.blank
    }
    
    func pushOperatorInStack(_ input: String) {
        stack.push(input)
    }
    
    func calculate(using stackTopOperator: String) {
        guard let first = postfix.popLast() else { return }
        guard let firstNumber = Double(first) else { return }
        guard let second = postfix.popLast() else { return }
        guard let secondNumber = Double(second) else { return }
        let result = infixCalculate(firstNumber: firstNumber, operatorSymbol: stackTopOperator, secondNumber: secondNumber)
        postfix.append(result)
    }
    
    func calculateHigherPrioritythan(_ input: String) {
        guard let inputPriority = OperatorType(rawValue: input)?.priority else { return }
        guard let stackTopOperator = stack.peek else { return }
        guard let stackTopOperatorPriority = OperatorType(rawValue: stackTopOperator)?.priority else { return }
        
        if inputPriority == stackTopOperatorPriority {
            calculate(using: stackTopOperator)
            stack.pop()
        } else if inputPriority < stackTopOperatorPriority {
            for _ in Constant.zero..<stack.count {
                guard let loopStackTopOperator = stack.pop() else { return }
                calculate(using: loopStackTopOperator)
            }
        }
    }
    
    func display() -> String? {
        guard let postfixLastNumber = postfix.last else { return nil }
        let filteredNumber = extractInteger(number: postfixLastNumber)
        return filteredNumber
    }
    
    private func extractInteger(number: String) -> String {
        let array = number.components(separatedBy: Constant.dot)
        guard let primeNumber = array.last, let integerNumber = array.first else { return number }
        if primeNumber.count == Constant.integerOne && primeNumber == Constant.stringOne {
            return integerNumber
        } else {
            return number
        }
    }
    
    func reset() {
        stack.removeAll()
        postfix.removeAll()
        numberInput = Constant.blank
    }
}
