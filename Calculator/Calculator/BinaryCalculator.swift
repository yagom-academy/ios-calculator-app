//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by Neph on 2021/03/23.
//

import Foundation

class BinaryCalculator: Computable, Resettable {
    
    var stack = Stack.shared
    func add(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Int(firstNumber),
              let second = Int(secondNumber) else {
            return nil
        }
        let result = first + second
        return String(result, radix: 2)
    }
    
    func subtract(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Int(firstNumber),
              let second = Int(secondNumber) else {
            return nil
        }
        let result = first - second
        return String(result, radix: 2)
    }
    
    func AND(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Int(firstNumber),
              let second = Int(secondNumber) else {
            return nil
        }
        let result = first & second
        return String(result, radix: 2)
    }
    
    func NAND(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Int(firstNumber),
              let second = Int(secondNumber) else {
            return nil
        }
        let result = ~(first & second)
        return String(result, radix: 2)
    }
    
    func OR(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Int(firstNumber),
              let second = Int(secondNumber) else {
            return nil
        }
        let result = first | second
        return String(result, radix: 2)
    }
    
    func NOR(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Int(firstNumber),
              let second = Int(secondNumber) else {
            return nil
        }
        let result = ~(first | second)
        return String(result, radix: 2)
    }
    
    func XOR(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Int(firstNumber),
              let second = Int(secondNumber) else {
            return nil
        }
        let result = first ^ second
        return String(result, radix: 2)
    }
    
    func NOT(firstNumber: String) -> String? {
        guard let first = Int(firstNumber) else {
            return nil
        }
        let result = ~first
        return String(result, radix: 2)
    }
    
    func shiftLeft(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Int(firstNumber),
              let second = Int(secondNumber) else {
            return nil
        }
        let result = first << second
        return String(result, radix: 2)
    }
    
    func shigtRight(firstNumber: String, secondNumber: String) -> String? {
        guard let first = Int(firstNumber),
              let second = Int(secondNumber) else {
            return nil
        }
        let result = first >> second
        return String(result, radix: 2)
    }
    
    func reset() {
        
    }
    
}
