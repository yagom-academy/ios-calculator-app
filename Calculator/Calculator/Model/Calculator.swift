//
//  Calculator.swift
//  Calculator
//
//  Created by 김태영 on 2021/06/22.
//

import Foundation

extension Double {
    func toString() -> String {
        return String(format: "%f", self)
    }
}

struct Calculator {
    var operatorStack: Stack<String>
    var postFixExpression: [String]
    var inputNumbers: [String]
    
    // 수식 입력
    mutating func enterExpression(operation: String, inputNumber: String) {
        operatorStack.push(item: operation)
        inputNumbers.append(inputNumber)
    }
    
    // 전부 지워
    mutating func allClear() {
        while operatorStack.isEmpty() == false {
            operatorStack.pop()
        }
        inputNumbers.removeAll()
    }
    // 연산자 인가?
    func isOperator(item: String) -> Bool {
        switch item {
        case "+", "-", "x", "÷":
            return true
        default:
            return false
        }
    }
    
    func calculate(input: [String]) -> String {
        var calculationStack = Stack<Double>()
        var input = input
        
        while !input.isEmpty {
            let firstValue = input.removeFirst()
            if isOperator(item: firstValue) {
                guard let secondOperand = calculationStack.pop() else {return ""}
                guard let firstOperand = calculationStack.pop() else {return ""}
                let outCome = performOperation(firstOperand: firstOperand, secondOperand: secondOperand, operation: firstValue)
                
                calculationStack.push(item: outCome)
            } else {
                guard let operand = Double(firstValue) else { return "" }
                
                calculationStack.push(item: operand)
            }
        }
        guard let finalResult = calculationStack.pop() else { return "" }
        return finalResult.toString()
    }
    
    func performOperation(firstOperand: Double, secondOperand: Double, operation: String) -> Double {
        switch operation {
        case "+" : return firstOperand + secondOperand
        case "-" : return firstOperand - secondOperand
        case "x" : return firstOperand * secondOperand
        case "÷" : return firstOperand / secondOperand
            
        default:
            return 0.0
        }
    }
}



