//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by Yeon on 2020/12/07.
//

import Foundation

class BinaryCalculator {
    var postfixStack: Stack = Stack<String>()
    var calculateStack: Stack = Stack<String>()
    let binaryOperator: [String] = BinaryOperatorType.allCases.map{ $0.rawValue }
    init() {}
    
    private func precedence(_ binaryOperator: BinaryOperatorType) -> Int {
        let high: BinaryOperatorPrecedence = .high
        let low: BinaryOperatorPrecedence = .low
        let zero: BinaryOperatorPrecedence = .zero
        
        switch binaryOperator {
        case .NOT, .RightShift, .LeftShift:
            return high.rawValue
        case .AND, .NAND:
            return low.rawValue
        case .XOR, .NOR, .OR, .minus, .plus:
            return zero.rawValue
        }
    }
    
    private func transformToPostfix(_ infix: [String]) throws -> [String] {
        var postfix = [String]()
        for element in infix {
            if binaryOperator.contains(element) {
                if !postfixStack.isEmpty {
                    if let top = postfixStack.peek() {
                        var stackTopOperatorType = try getOperatorType(of: top)
                        let currentOperatorType = try getOperatorType(of: element)
                        while(!postfixStack.isEmpty &&
                                precedence(stackTopOperatorType) >= precedence(currentOperatorType)) {
                            guard let top = postfixStack.pop() else {
                                throw CalculatorError.stackIsEmpty
                            }
                            postfix.append(top)
                            if let topAfterPop = postfixStack.peek() {
                                stackTopOperatorType = try getOperatorType(of: topAfterPop)
                            }
                        }
                    }
                }
                postfixStack.push(element)
            }
            else {
                postfix.append(element)
            }
        }
        while !postfixStack.isEmpty {
            if let top = postfixStack.pop() {
                postfix.append(top)
            }
        }
        return postfix
    }
    
    private func getOperatorType(of binaryOperator: String) throws -> BinaryOperatorType {
        guard let operatorType = BinaryOperatorType(rawValue: binaryOperator) else {
            throw CalculatorError.unknown
        }
        return operatorType
    }
}

extension BinaryCalculator: BasicCalculable {
    func add(first: String, second: String) throws -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2),
              let secondNumber = Int(second, radix: 2) else {
            throw CalculatorError.unknown
        }
        result = firstNumber + secondNumber
        return String(result, radix: 2)
    }
    
    func subtract(first: String, second: String) throws -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2),
              let secondNumber = Int(second, radix: 2) else {
            throw CalculatorError.unknown
        }
        result = firstNumber - secondNumber
        return String(result, radix: 2)
    }
    
    func clear() {
        postfixStack.removeAll()
        calculateStack.removeAll()
    }
}

extension BinaryCalculator: BinaryCalculable {
    func and(first: String, second: String) throws -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2),
              let secondNumber = Int(second, radix: 2) else {
            throw CalculatorError.unknown
        }
        result = firstNumber & secondNumber
        return String(result, radix: 2)
    }
    
    func or(first: String, second: String) throws -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2),
              let secondNumber = Int(second, radix: 2) else {
            throw CalculatorError.unknown
        }
        result = firstNumber | secondNumber
        return String(result, radix: 2)
    }
    
    func xor(first: String, second: String) throws -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2),
              let secondNumber = Int(second, radix: 2) else {
            throw CalculatorError.unknown
        }
        result = firstNumber ^ secondNumber
        return String(result, radix: 2)
    }
    
    func nor(first: String, second: String) throws -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2),
              let secondNumber = Int(second, radix: 2) else {
            throw CalculatorError.unknown
        }
        result = ~(firstNumber & secondNumber)
        return String(result, radix: 2)
    }
    
    func not(first: String) throws -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2) else {
            throw CalculatorError.unknown
        }
        result = ~firstNumber
        return String(result, radix: 2)
    }
    
    func nand(first: String, second: String) throws -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2),
              let secondNumber = Int(second, radix: 2) else {
            throw CalculatorError.unknown
        }
        result = ~(firstNumber & secondNumber)
        return String(result, radix: 2)
    }
    
    func rightShift(first: String, second: String) throws -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2),
              let secondNumber = Int(second) else {
            throw CalculatorError.unknown
        }
        result = firstNumber >> secondNumber
        return String(result, radix: 2)
    }
    
    func leftShift(first: String, second: String) throws -> String {
        var result: Int
        guard let firstNumber = Int(first, radix: 2),
              let secondNumber = Int(second) else {
            throw CalculatorError.unknown
        }
        result = firstNumber << secondNumber
        return String(result, radix: 2)
    }
}
