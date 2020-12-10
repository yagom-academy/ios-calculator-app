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
    let decimalOperator: [String] = DecimalOperatorType.allCases.map{ $0.rawValue }
    init() {}
    
    private func precedence(_ decimalOperator: DecimalOperatorType) -> Int {
        let high: DecimalOperatorPrecedence = .high
        let low: DecimalOperatorPrecedence = .low
        
        switch decimalOperator {
        case .multiplication, .division :
            return high.rawValue
        case .plus, .minus :
            return low.rawValue
        }
    }
    
    private func transformToPostfix(_ infix: [String]) throws -> [String] {
        var postfix = [String]()
        for element in infix {
            if decimalOperator.contains(element) {
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
    
    func calculate(_ infix: [String]) throws -> String {
        let formula: [String] = try transformToPostfix(infix)
        for element in formula {
            if decimalOperator.contains(element) {
                let currentOperatorType = try getOperatorType(of: element)
                if let secondNum = calculateStack.pop(), let firstNum = calculateStack.pop() {
                    switch currentOperatorType {
                    case .plus:
                        calculateStack.push(try add(first: firstNum, second: secondNum))
                    case .minus:
                        calculateStack.push(try subtract(first: firstNum, second: secondNum))
                    case .multiplication:
                        calculateStack.push(try multiply(first: firstNum, second: secondNum))
                    case .division:
                        calculateStack.push(try divide(first: firstNum, second: secondNum))
                    }
                }
            }
            else {
                calculateStack.push(element)
            }
        }
        guard let result = calculateStack.pop() else {
            throw CalculatorError.unknown
        }
        return result
    }
    
    func getOperatorType(of decimalOperator: String) throws -> DecimalOperatorType {
        guard let operatorType = DecimalOperatorType(rawValue: decimalOperator) else {
            throw CalculatorError.unknown
        }
        return operatorType
    }
}

extension DecimalCalculator: BasicCalculable {
    func add(first: String, second: String) throws -> String {
        var result: Double
        let firstNumber: Double = (first as NSString).doubleValue
        let secondNumber: Double = (second as NSString).doubleValue
        result = firstNumber + secondNumber
        return String(describing: result)
    }
    
    func subtract(first: String, second: String) throws -> String {
        var result: Double
        let firstNumber: Double = (first as NSString).doubleValue
        let secondNumber: Double = (second as NSString).doubleValue
        result = firstNumber - secondNumber
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
        let firstNumber: Double = (first as NSString).doubleValue
        let secondNumber: Double = (second as NSString).doubleValue
        result = firstNumber * secondNumber
        return String(describing: result)
    }
    
    func divide(first: String, second: String) throws -> String {
        var result: Double
        let firstNumber: Double = (first as NSString).doubleValue
        let secondNumber: Double = (second as NSString).doubleValue
        
        if secondNumber == 0 {
            throw CalculatorError.divideByZero
        } else {
            result = firstNumber / secondNumber
        }
        return String(describing: result)
    }
}
