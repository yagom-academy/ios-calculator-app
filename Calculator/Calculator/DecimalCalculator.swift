//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by Neph on 2021/03/23.
//

import Foundation

class DecimalCalculator: Computable, Resettable {
    
    var stack = Stack.shared
   
    func add(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            return nil
        }
        let result = first + second
        return String(result)
    }
    
    func subtract(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            return nil
        }
        let result = first - second
        return String(result)
    }
    
    func multiply(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            return nil
        }
        let result = first * second
        return String(result)
    }
    
    func divide(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            return nil
        }
        let result = first / second
        return String(result)
    }
    
    func reset() {
        
    }
    
}
