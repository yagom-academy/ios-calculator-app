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
    var isCalculated: Bool = false
    
    func handleNumbers(input: String) -> String {
        if currentNumber == "0" || isCalculated {
            currentNumber = input
            isCalculated = false
        } else {
            currentNumber += input
        }
        
        return currentNumber
    }
    
    func handleDotSign(input: String) -> String {
        if !currentNumber.contains(".") {
            currentNumber += input
        }
        return currentNumber
    }
    
    func handleHundredNumber(input: String) -> String {
        if currentNumber != "0" {
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
    
    func handleResultExpression() -> String {
        expression += currentOperator + currentNumber
        
        var resultByParse = ExpressionParser.parse(from: expression)
        let calculateResult = String(resultByParse.result())
        clearInputManager()
        currentNumber = convertToFormattedString(number: calculateResult)
        isCalculated = true
        
        return calculateResult
    }
    
    func clearInputManager() {
        expression = ""
        currentNumber = "0"
        currentOperator = ""
    }
    
    func convertToFormattedString(number: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let numberMappedToDouble = Double(number) else { return "" }
        guard let result = numberFormatter.string(from: NSNumber( value:numberMappedToDouble )) else { return "" }
        
        return result
    }
}
