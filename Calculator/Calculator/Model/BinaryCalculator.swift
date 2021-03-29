//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by 이영우 on 2021/03/22.
//

import Foundation

final class BinaryCalculator: BinaryCalculatable {
    static let shared = BinaryCalculator()
    
    private init() { }
    
    var stack: Stack = Stack<String>()
    var postfixNumbers = [String]()
    var operand = Constant.blank
    let operatorArray = OperatorType.allCases.map{ $0.rawValue }
    
    func input(_ input: String) {
        if !operatorArray.contains(input) {
            operand = operand + input
        } else if input == OperatorType.equal.symbol {
            postfixNumbers.append(operand)
            operand = Constant.blank
            popAllOperatorToList()
            for _ in Constant.zero..<postfixNumbers.count {
                calculate()
            }
        } else if input == OperatorType.not.symbol {
            guard let binaryNumber = UInt8(operand, radix: Constant.binary) else { return }
            let result = ~binaryNumber
            stack.push(String(result, radix: Constant.binary))
            operand = Constant.blank
        } else {
            postfixNumbers.append(operand)
            operand = Constant.blank
            popHigherPrioritythan(input)
            pushOperatorInStack(input)
        }
    }
    
    func calculate() {
        let postfixFirst = postfixNumbers.removeFirst()
        if !operatorArray.contains(postfixFirst) {
            stack.push(postfixFirst)
            return
        }
        
        guard let stackFirst = stack.pop() else { return }
        guard let numberFirst = UInt8(stackFirst, radix: Constant.binary) else { return }
        
        guard let stackSecond = stack.pop() else { return }
        guard let numberSecond = UInt8(stackSecond, radix: Constant.binary) else { return }
        
        let result = infixCalculate(firstNumber: numberFirst, operatorSymbol: postfixFirst, secondNumber: numberSecond)
        stack.push(result)
    }
    
    func infixCalculate(firstNumber: UInt8, operatorSymbol: String, secondNumber: UInt8) -> String {
        var result: UInt8 = Constant.uInt8Zero
        let error: Error = CalculatorError.invalidOperator
        
        switch operatorSymbol {
        case OperatorType.subtract.symbol:
            result = secondNumber - firstNumber
        case OperatorType.add.symbol:
            result = secondNumber + firstNumber
        case OperatorType.or.symbol:
            result = secondNumber | firstNumber
        case OperatorType.nor.symbol:
            result = ~(secondNumber | firstNumber)
        case OperatorType.and.symbol:
            result = secondNumber & firstNumber
        case OperatorType.nand.symbol:
            result = ~(secondNumber & firstNumber)
        case OperatorType.xor.symbol:
            result = secondNumber ^ firstNumber
        case OperatorType.leftShift.symbol:
            result = secondNumber << firstNumber
        case OperatorType.rightShift.symbol:
            result = secondNumber >> firstNumber
        default:
            print(error.localizedDescription)
            fatalError()
        }
        return String(result, radix: Constant.binary)
    }
    
    func pushOperatorInStack(_ input: String) {
        stack.push(input)
    }
    
    func popAllOperatorToList() {
        for _ in Constant.zero..<stack.count {
            guard let stackTop = stack.pop() else { return }
            postfixNumbers.append(stackTop)
        }
    }
    
    func popHigherPrioritythan(_ input: String) {
        guard let inputPriority = OperatorType(rawValue: input)?.priority else { return }
        
        for _ in Constant.zero..<stack.count {
            guard let stackTop = stack.peek else { return }
            guard let stackTopOperatorType = OperatorType(rawValue: stackTop) else { return }
            if inputPriority <= stackTopOperatorType.priority {
                guard let value = stack.pop() else { return }
                postfixNumbers.append(value)
            } else {
                postfixNumbers.append(input)
                break
            }
        }
    }
    
    func display() -> String? {
        guard let last = stack.peek else { return nil }
        return last
    }
    
    func reset() {
        stack.removeAll()
        postfixNumbers.removeAll()
        operand = Constant.blank
    }
}
