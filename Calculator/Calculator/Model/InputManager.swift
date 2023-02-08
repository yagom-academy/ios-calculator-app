//
//  InputManager.swift
//  Calculator
//
//  Created by Harry, Goat on 2023/02/08.
//

import Foundation

final class InputManager {
    var expression = ""
    var currentNumber = "0"
    var currentOperator = ""
    
    func handleNumbers(input: String) -> String {
        if currentNumber == "0" {
            currentNumber = input
        } else {
            currentNumber += input
        }
        
        return currentNumber
    }
    
    func handleDotSign(input: String) -> String {
        if currentNumber.contains(".") {
            return currentNumber
        } else {
            currentNumber += input
        }
        
        return currentNumber
    }
    
    func handleHundredNumber(input: String) -> String {
        if currentNumber == "0" {
            return currentNumber
        } else {
            currentNumber += input
        }
        
        return currentNumber
    }
    
    func handleConvertSign() -> String {
        guard currentNumber != "0" else {
            return currentNumber
        }
        
        if currentNumber.first == "−" {
            currentNumber.removeFirst()
        } else {
            currentNumber = "−" + currentNumber
        }
        
        return currentNumber
    }
    
    func handleOperator() -> (operatorText: String, operandText: String) {
        if expression == "" {
            expression += currentNumber
        } else {
            expression += currentOperator + currentNumber
        }
        
        return (currentOperator, currentNumber)
    }
    
}
