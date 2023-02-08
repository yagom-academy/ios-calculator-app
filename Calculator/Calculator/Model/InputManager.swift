//
//  InputManager.swift
//  Calculator
//
//  Created by Harry, Goat on 2023/02/08.
//

import Foundation

final class InputManager {
    var expression = ""
    var currentInput = "0"
    
    func handleNumbers(input: String) -> String {
        if currentInput == "0" {
            currentInput = input
        } else {
            currentInput += input
        }
        
        return currentInput
    }
    
    func handleDotSign(input: String) -> String {
        if currentInput.contains(".") {
            return currentInput
        } else {
            currentInput += input
        }
        
        return currentInput
    }
    
    func handleHundredNumber(input: String) -> String {
        if currentInput == "0" {
            return currentInput
        } else {
            currentInput += input
        }
        
        return currentInput
    }
    
    func handleConvertSign() -> String {
        guard currentInput != "0" else {
            return currentInput
        }
        
        if currentInput.first == "−" {
            currentInput.removeFirst()
        } else {
            currentInput = "−" + currentInput
        }
        
        return currentInput
    }
    
}
