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
    let scale: Int = 2
    let binaryOperator = BinaryOperatorType.allCases
    lazy var binaryOperators = binaryOperator.map({ (`operator`: BinaryOperatorType) -> String in
        return `operator`.rawValue
    })
    init() {}
    
    private func precedence(_ binaryOperator: BinaryOperatorType) -> Int {
        let highPrecedence: BinaryOperatorPrecedence = .high
        let midPrecedence: BinaryOperatorPrecedence = .mid
        let lowPrecedence: BinaryOperatorPrecedence = .low
        
        switch binaryOperator {
        case .NOT, .RightShift, .LeftShift:
            return highPrecedence.rawValue
        case .AND, .NAND:
            return midPrecedence.rawValue
        case .XOR, .NOR, .OR, .minus, .plus:
            return lowPrecedence.rawValue
        }
    }
    
    private func transformToPostfix(_ infix: [String]) throws -> [String] {
        var postfix = [String]()
        for element in infix {
            guard binaryOperators.contains(element) else {
                postfix.append(element)
                continue
            }
            guard !postfixStack.isEmpty else {
                postfixStack.push(element)
                continue
            }
            guard let top = postfixStack.peek() else {
                throw CalculatorError.stackIsEmpty
            }
            var stackTopOperatorType = try getOperatorType(of: top)
            let currentOperatorType = try getOperatorType(of: element)
            while(!postfixStack.isEmpty && precedence(stackTopOperatorType) >= precedence(currentOperatorType)) {
                guard let top = postfixStack.pop() else {
                    throw CalculatorError.stackIsEmpty
                }
                postfix.append(top)
                if let topAfterPop = postfixStack.peek() {
                    stackTopOperatorType = try getOperatorType(of: topAfterPop)
                }
            }
            postfixStack.push(element)
        }
        
        for _ in 0..<postfixStack.size {
            if let top = postfixStack.pop() {
                postfix.append(top)
            }
        }
        
        return postfix
    }
    
    func calculate(_ infix: [String]) throws -> String {
        let formula: [String] = try transformToPostfix(infix)
        for element in formula {
            guard binaryOperators.contains(element) else {
                calculateStack.push(element)
                continue
            }
            let currentOperatorType = try getOperatorType(of: element)
            guard let calculateResult = try selectCalculateTypeAndCalculate(operatorType: currentOperatorType) else {
                throw CalculatorError.notDefinedOperator
            }
            calculateStack.push(calculateResult)
        }
        guard let result = calculateStack.pop() else {
            throw CalculatorError.stackIsEmpty
        }
        
        return result
    }
    
    private func selectCalculateTypeAndCalculate(operatorType: BinaryOperatorType) throws -> String? {
        switch operatorType {
        case .plus:
            if let secondNumber = calculateStack.pop(),
               let firstNumber = calculateStack.pop() {
                return try add(first: firstNumber, second: secondNumber)
            }
        case .minus:
            if let secondNumber = calculateStack.pop(),
               let firstNumber = calculateStack.pop() {
                return try subtract(first: firstNumber, second: secondNumber)
            }
        case .AND:
            if let secondNumber = calculateStack.pop(),
               let firstNumber = calculateStack.pop() {
                return try and(first: firstNumber, second: secondNumber)
            }
        case .NAND:
            if let secondNumber = calculateStack.pop(),
               let firstNumber = calculateStack.pop() {
                return try nand(first: firstNumber, second: secondNumber)
            }
        case .OR:
            if let secondNumber = calculateStack.pop(),
               let firstNumber = calculateStack.pop() {
                return try or(first: firstNumber, second: secondNumber)
            }
        case .NOR:
            if let secondNumber = calculateStack.pop(),
               let firstNumber = calculateStack.pop() {
                return try nor(first: firstNumber, second: secondNumber)
            }
        case .XOR:
            if let secondNumber = calculateStack.pop(),
               let firstNumber = calculateStack.pop() {
                return try xor(first: firstNumber, second: secondNumber)
            }
        case .LeftShift:
            if let firstNumber = calculateStack.pop() {
                return try leftShift(first: firstNumber)
            }
        case .RightShift:
            if let firstNumber = calculateStack.pop() {
                return try rightShift(first: firstNumber)
            }
        case .NOT:
            if let firstNumber = calculateStack.pop() {
                return try not(first: firstNumber)
            }
        }
        
        return nil
    }
    
    private func getOperatorType(of binaryOperator: String) throws -> BinaryOperatorType {
        guard let operatorType = BinaryOperatorType(rawValue: binaryOperator) else {
            throw CalculatorError.notDefinedOperator
        }
        return operatorType
    }
    
    private func stringNumberToIntNumber(_ stringNumber: String) throws -> Int {
        guard let intNumber = Int(stringNumber, radix: scale) else {
            throw CalculatorError.unknown
        }
        return intNumber
    }
}

extension BinaryCalculator: BasicCalculable {
    func add(first: String, second: String) throws -> String {
        var result: Int
        result = try stringNumberToIntNumber(first) + stringNumberToIntNumber(second)
        return String(result, radix: scale)
    }
    
    func subtract(first: String, second: String) throws -> String {
        var result: Int
        result = try stringNumberToIntNumber(first) - stringNumberToIntNumber(second)
        return String(result, radix: scale)
    }
    
    func clear() {
        postfixStack.removeAll()
        calculateStack.removeAll()
    }
}

extension BinaryCalculator: BinaryCalculable {
    func and(first: String, second: String) throws -> String {
        var result: Int
        result = try stringNumberToIntNumber(first) & stringNumberToIntNumber(second)
        return String(result, radix: scale)
    }
    
    func or(first: String, second: String) throws -> String {
        var result: Int
        result = try stringNumberToIntNumber(first) | stringNumberToIntNumber(second)
        return String(result, radix: scale)
    }
    
    func xor(first: String, second: String) throws -> String {
        var result: Int
        result = try stringNumberToIntNumber(first) ^ stringNumberToIntNumber(second)
        return String(result, radix: scale)
    }
    
    func nor(first: String, second: String) throws -> String {
        var result: Int
        result = try ~(stringNumberToIntNumber(first) | stringNumberToIntNumber(second))
        return String(result, radix: scale)
    }
    
    func not(first: String) throws -> String {
        var result: Int
        result = try ~stringNumberToIntNumber(first)
        return String(result, radix: scale)
    }
    
    func nand(first: String, second: String) throws -> String {
        var result: Int
        result = try ~(stringNumberToIntNumber(first) & stringNumberToIntNumber(second))
        return String(result, radix: scale)
    }
    
    func rightShift(first: String) throws -> String {
        var result: Int
        result = try stringNumberToIntNumber(first) >> 1
        return String(result, radix: scale)
    }
    
    func leftShift(first: String) throws -> String {
        var result: Int
        result = try stringNumberToIntNumber(first) << 1
        return String(result, radix: scale)
    }
}
