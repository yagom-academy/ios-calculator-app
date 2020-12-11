//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by Yeon on 2020/12/07.
//

import Foundation

class DecimalCalculator {
    var postfixStack: Stack = Stack<String>()
    var calculateStack: Stack = Stack<String>()
    let decimalOperator = DecimalOperatorType.allCases
    lazy var decimalOperators = decimalOperator.map({ (`operator`: DecimalOperatorType) -> String in
        return `operator`.rawValue
    })
    init() {}
    
    private func precedence(_ decimalOperator: DecimalOperatorType) -> Int {
        let highPrecedence: DecimalOperatorPrecedence = .high
        let lowPrecedence: DecimalOperatorPrecedence = .low
        
        switch decimalOperator {
        case .multiplication, .division :
            return highPrecedence.rawValue
        case .plus, .minus :
            return lowPrecedence.rawValue
        }
    }
    
    private func transformToPostfix(_ infix: [String]) throws -> [String] {
        var postfix = [String]()
        for element in infix {
            guard decimalOperators.contains(element) else {
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
            guard decimalOperators.contains(element) else {
                calculateStack.push(element)
                continue
            }
            let currentOperatorType = try getOperatorType(of: element)
            guard let calculateResult = try selectCalculatorTypeAndCalculate(operatorType: currentOperatorType) else {
                throw CalculatorError.notDefinedOperator
            }
            calculateStack.push(calculateResult)
        }
        guard let result = calculateStack.pop() else {
            throw CalculatorError.stackIsEmpty
        }
        
        return result
    }
    
    private func selectCalculatorTypeAndCalculate(operatorType: DecimalOperatorType) throws -> String? {
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
        case .multiplication:
            if let secondNumber = calculateStack.pop(),
               let firstNumber = calculateStack.pop() {
                return try multiply(first: firstNumber, second: secondNumber)
            }
        case .division:
            if let secondNumber = calculateStack.pop(),
               let firstNumber = calculateStack.pop() {
                return try divide(first: firstNumber, second: secondNumber)
            }
        }
        
        return nil
    }
    
    private func getOperatorType(of decimalOperator: String) throws -> DecimalOperatorType {
        guard let operatorType = DecimalOperatorType(rawValue: decimalOperator) else {
            throw CalculatorError.notDefinedOperator
        }
        return operatorType
    }
    
    private func stringNumberToDoubleNumber(_ stringNumber: String) -> Double {
        let doubleNumber: Double = (stringNumber as NSString).doubleValue
        return doubleNumber
    }
}

extension DecimalCalculator: BasicCalculable {
    func add(first: String, second: String) throws -> String {
        var result: Double
        result = stringNumberToDoubleNumber(first) + stringNumberToDoubleNumber(second)
        return String(describing: result)
    }
    
    func subtract(first: String, second: String) throws -> String {
        var result: Double
        result = stringNumberToDoubleNumber(first) - stringNumberToDoubleNumber(second)
        return String(describing: result)
    }
    
    func clear() {
        postfixStack.removeAll()
        calculateStack.removeAll()
    }
}

extension DecimalCalculator: DecimalCalculable {
    func multiply(first: String, second: String) throws -> String {
        var result: Double
        result = stringNumberToDoubleNumber(first) * stringNumberToDoubleNumber(second)
        return String(describing: result)
    }
    
    func divide(first: String, second: String) throws -> String {
        var result: Double
        let secondNumber = stringNumberToDoubleNumber(second)
        guard secondNumber != 0 else {
            throw CalculatorError.divideByZero
        }
        
        result = stringNumberToDoubleNumber(first) / secondNumber
        return String(describing: result)
    }
}
