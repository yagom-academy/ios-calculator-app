//
//  Calculator.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/30.
//

import Foundation


struct DecimalCalculator: Addable, Subtractable, TypeConvertible {
    typealias T = Double
    var stack = Stack<Double>()
    var userInputNumber: Double = 0
    var userInputOperator: String = Operator.addition
    
    func divide(_ operatedNumber: Double, by operatingNumber: Double) -> Double {
        return operatedNumber / operatingNumber
    }
    
    func multiply(_ operatedNumber: Double, by operatingNumber: Double) -> Double {
        return operatedNumber * operatingNumber
    } 
    
    func inputAndConvertTypeOfNumber() -> Double {
        guard let number = readLine() else { return 0 }
        guard let userInputNumber = Double(number) else { return 0 }
        return userInputNumber
    }
    
    func inputAndConvertTypeOfOperator() -> String {
        guard let inputOperator = readLine() else { return "연산자를 입력해주세요." }
        var userInputOperator = inputOperator
        
        switch userInputOperator {
        case "+":
            return userInputOperator = Operator.addition
        case "-":
            return userInputOperator = Operator.subtraction
        case "*":
            return userInputOperator = Operator.multiplication
        case "/":
            return userInputOperator = Operator.division
        default:
            return "연산자를 입력해주세요."
        }
        
        
    }
    
    mutating func eachOperator(operatedNumber: Double, operatingNumber: Double) -> Double {
        switch userInputOperator {
        case .addition:
           return add(operatedNumber, and: operatingNumber)
        case .subtraction:
            return subtract(operatedNumber, and: operatingNumber)
        case .multiplication:
            return multiply(operatedNumber, by: operatingNumber)
        case .division:
            return divide(operatedNumber, by: operatingNumber)
        default: return 0
        }
    }
    
    mutating func executeOperate() {
        for i in 1...10 {
        stack.push(inputAndConvertTypeOfNumber())
            stack.push(eachOperator(operatedNumber: stack.pop()!, operatingNumber: inputAndConvertTypeOfNumber()))
        } 
    }
}


