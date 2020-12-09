//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by Yeon on 2020/12/07.
//

import Foundation

protocol DecimalCalculable {
    func divide(first: String, second: String) throws -> String
}

class DecimalCalculator: BasicCalculable, DecimalCalculable {
    var decimalStack: Stack = Stack<String>()
    var decimalStack2: Stack = Stack<String>()
    var infix: String?
    
    func precedence(`operator`: Character) -> Int {
        if `operator` == "*" || `operator` == "/" {
            return 2
        }
        else if `operator` == "+" || `operator` == "-" {
            return 1
        }
        else {
            return 0
        }
    }
    
    func transformToPostfix(_ infix: String) -> String {
        var postfix: String = ""
        for index in 0..<infix.count {
            let char = infix[infix.index(infix.startIndex, offsetBy: index)]
            if  char == "+" || char == "-" || char == "*" || char == "/" {
                if !decimalStack.isEmpty {
                    if let top = decimalStack.peek() {
                        let topToChar = top[top.index(top.startIndex, offsetBy: 0)]

                        while(!decimalStack.isEmpty &&
                                precedence(operator: topToChar) >= precedence(operator: char)){
                            if let top = decimalStack.pop() {
                                postfix +=  top
                            }
                        }
                    }
                }
                decimalStack.push(element: String(describing: char))
            }
            else if char >= "0" && char <= "9" {
                postfix += String(describing: char)
            }
        }
        while !decimalStack.isEmpty {
            if let top = decimalStack.pop() {
                postfix +=  top
            }
        }
        return postfix
    }
    
    func calculate(infix: String) -> String {
        let formula: String = transformToPostfix(infix)
        
        for index in 0..<formula.count {
            let char = formula[formula.index(formula.startIndex, offsetBy: index)]
            if char >= "0" && char <= "9" {
                decimalStack2.push(element: String(describing: char))
            }
            else if char == "+" || char == "-" || char == "*" || char == "/" {
                if let secondNum = decimalStack2.pop(), let firstNum = decimalStack2.pop() {
                    if char == "+" {
                        decimalStack2.push(element: add(first: firstNum, second: secondNum))
                    }
                    if char == "-" {
                        decimalStack2.push(element: subtract(first: firstNum, second: secondNum))
                    }
                    if char == "*" {
                        decimalStack2.push(element: multiply(first: firstNum, second: secondNum))
                    }
                    if char == "/" {
                        do {
                            try decimalStack2.push(element: divide(first: firstNum, second: secondNum))
                        } catch {
                            return "오류"
                        }
                    }
                }
            }
        }
        
        if let result = decimalStack2.pop() {
            return result
        } else {
            return "오류"
        }
    }
    
    
    init() {}
    
    func add(first: String, second: String) -> String {
        var result: Double
        let firstNumber: Double = (first as NSString).doubleValue
        let secondNumber: Double = (second as NSString).doubleValue
        result = firstNumber + secondNumber
        return String(describing: result)
    }
    
    func subtract(first: String, second: String) -> String {
        var result: Double
        let firstNumber: Double = (first as NSString).doubleValue
        let secondNumber: Double = (second as NSString).doubleValue
        result = firstNumber - secondNumber
        return String(describing: result)
    }
    
    func multiply(first: String, second: String) -> String {
        var result: Double
        let firstNumber: Double = (first as NSString).doubleValue
        let secondNumber: Double = (second as NSString).doubleValue
        result = firstNumber * secondNumber
        return String(describing: result)
    }
    
    func clear() {
        decimalStack.removeAll()
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
