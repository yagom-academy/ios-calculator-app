//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by 이영우 on 2021/03/22.
//

import Foundation

final class BinaryCalculator: Calculatable {
    private var stack: Stack = Stack<String>()
    private var postfixNumbers = [String]()
    private var operand = String.blank
    private let operators = BinaryOperatorType.allCases.map{ $0.rawValue }
    
    func input(_ input: String) {
        if !operators.contains(input) {
            operand = operand + input
        } else if input == BinaryOperatorType.equal.symbol {
            postfixNumbers.append(operand)
            operand = String.blank
            moveAllToPostfixNumbers()
            for _ in Int.zero..<postfixNumbers.count {
                let postfixFirstOperator = postfixNumbers.removeFirst()
                calculate(currentOperator: postfixFirstOperator)
            }
        } else if input == BinaryOperatorType.not.symbol {
            guard let binaryNumber = UInt8(operand, radix: Int.binary) else { return }
            let result = ~binaryNumber
            stack.push(String(result, radix: Int.binary))
            operand = String.blank
        } else {
            postfixNumbers.append(operand)
            operand = String.blank
            moveHigherPrioritythan(input)
            pushOperatorInStack(input)
        }
    }
    
    func calculate(currentOperator: String) {
        if !operators.contains(currentOperator) {
            stack.push(currentOperator)
            return
        }
        
        guard let stackFirst = stack.pop() else { return }
        guard let numberFirst = UInt8(stackFirst, radix: Int.binary) else { return }
        
        guard let stackSecond = stack.pop() else { return }
        guard let numberSecond = UInt8(stackSecond, radix: Int.binary) else { return }
        
        let result = infixCalculate(firstNumber: numberFirst, operatorSymbol: currentOperator, secondNumber: numberSecond)
        stack.push(result)
    }
    
    func infixCalculate(firstNumber: UInt8, operatorSymbol: String, secondNumber: UInt8) -> String {
        var result: UInt8 = UInt8.zero
        let error: Error = CalculatorError.invalidOperator
        
        switch operatorSymbol {
        case BinaryOperatorType.subtract.symbol:
            result = secondNumber - firstNumber
        case BinaryOperatorType.add.symbol:
            result = secondNumber + firstNumber
        case BinaryOperatorType.or.symbol:
            result = secondNumber | firstNumber
        case BinaryOperatorType.nor.symbol:
            result = ~(secondNumber | firstNumber)
        case BinaryOperatorType.and.symbol:
            result = secondNumber & firstNumber
        case BinaryOperatorType.nand.symbol:
            result = ~(secondNumber & firstNumber)
        case BinaryOperatorType.xor.symbol:
            result = secondNumber ^ firstNumber
        case BinaryOperatorType.leftShift.symbol:
            result = secondNumber << firstNumber
        case BinaryOperatorType.rightShift.symbol:
            result = secondNumber >> firstNumber
        default:
            print(error.localizedDescription)
            fatalError()
        }
        return String(result, radix: Int.binary)
    }
    
    func pushOperatorInStack(_ input: String) {
        stack.push(input)
    }
    
    func moveAllToPostfixNumbers() {
        for _ in Int.zero..<stack.count {
            guard let stackTop = stack.pop() else { return }
            postfixNumbers.append(stackTop)
        }
    }
    
    func moveHigherPrioritythan(_ input: String) {
        guard let inputPriority = BinaryOperatorType(rawValue: input)?.priority else { return }
        
        for _ in Int.zero..<stack.count {
            guard let stackTop = stack.peek else { return }
            guard let stackTopOperatorType = BinaryOperatorType(rawValue: stackTop) else { return }
            if inputPriority <= stackTopOperatorType.priority {
                guard let value = stack.pop() else { return }
                postfixNumbers.append(value)
            } else {
                postfixNumbers.append(input)
                break
            }
        }
    }
    
    func output() {
//        guard let last = stack.peek else { return nil }
//        return last
    }
    
    func reset() {
        stack.reset()
        postfixNumbers.removeAll()
        operand = String.blank
    }
}
