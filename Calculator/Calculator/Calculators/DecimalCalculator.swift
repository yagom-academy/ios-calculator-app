//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/26.
//

import Foundation

struct DecimalCalculator: Addable, Subtractable, GetStack {
    typealias T = Double
    var stack = Stack<Double>()
    var temporaryString: String = "exit"
    var temporaryDouble: Double = 0
    
    mutating func userInputNumber() -> Double {
        guard let userInputOfString = readLine() else { return 0 }
        guard let userInputOfDouble = Double(userInputOfString) else { return 0 }
        temporaryDouble = userInputOfDouble
        return userInputOfDouble
    }
    
    mutating func userInputOperator() -> String {
        guard let userInputOfString = readLine() else { return "잘못된 입력입니다." }
        temporaryString = userInputOfString
        return userInputOfString
    }
    
    mutating func multuply(_ operatedNumber: Double, and operatingNumber: Double) -> Double {
        return operatedNumber * operatingNumber
    }
    
    mutating func divide(_ operatedNumber: Double, and operatingNumber: Double) -> Double {
        return operatedNumber / operatingNumber
    }
    
    mutating func takeSumAndReset() {
        let a = stack.sumAllElements()
        stack.reset()
        stack.push(a)
    }
    
    mutating func executeCalculator() {
        userInputOperator()
        self.stack.push(temporaryDouble)
        switch temporaryString {
        case "+":
            takeSumAndReset()
            temporaryDouble = userInputNumber()
        case "-":
            takeSumAndReset()
            temporaryDouble = -userInputNumber()
        case "*":
            temporaryDouble = multuply(stack.pop()!, and: userInputNumber())
        case "/":
            temporaryDouble = divide(stack.pop()!, and: userInputNumber())
        case "=":
            takeSumAndReset()
        default: print("잘못된 입력입니다.")
        }
    }
    
    mutating func start() {
        userInputNumber()
        while temporaryString != "exit" {
            executeCalculator()
        }
    }
}
