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
    var userInputOperator: Operator = .addition
    
    func divide(_ operatedNumber: Double, by operatingNumber: Double) -> Double {
        return operatedNumber / operatingNumber
    }
    
    func multiply(_ operatedNumber: Double, by operatingNumber: Double) -> Double {
        return operatedNumber * operatingNumber
    } 
    
    func inputAndConvertTypeOfNumber(a: String?) -> Double {
        guard let number = a else { return 0 }
        guard let userInputNumber = Double(number) else { return 0 }
        return userInputNumber
    }
    
    func inputAndConvertTypeOfOperator() -> Operator {
        guard let userInputOperator = readLine() else { fatalError() }
        switch userInputOperator {
        case "+":
            return Operator.addition
        case "-":
            return Operator.subtraction
        case "*":
            return Operator.multiplication
        case "/":
            return Operator.division
        default:
            fatalError()
        }
        
        
    }
    
    mutating func eachOperator(operatedNumber: Double, operatingNumber: Double) -> Double {
        switch inputAndConvertTypeOfOperator() {
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
        for _ in 1...10 {
            stack.push(inputAndConvertTypeOfNumber(a: Optional("1")))
            stack.push(eachOperator(operatedNumber: stack.pop()!, operatingNumber: inputAndConvertTypeOfNumber(a: Optional("1"))))
        } 
    }
}


