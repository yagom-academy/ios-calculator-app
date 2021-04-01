//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by Neph on 2021/03/23.
//
import Foundation

final class BinaryCalculator: Computable {
    
    static func add(firstNumber: String, secondNumber: String) -> String {
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = first + second
            return try formatResult(of: result)
        } catch {
            return "-1"
        }
    }
    
    static func subtract(firstNumber: String, secondNumber: String) -> String {
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = first - second
            return try formatResult(of: result)
        } catch {
            return "-1"
        }
    }
    
    static func AND(firstNumber: String, secondNumber: String) -> String {
        
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = first & second
            return try formatResult(of: result)
        } catch {
            return "-1"
        }
        
    }
    
    static func NAND(firstNumber: String, secondNumber: String) -> String {
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = ~(first & second)
            return try formatResult(of: result)
        } catch {
            return "-1"
        }
    }
    
    static func OR(firstNumber: String, secondNumber: String) -> String {
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = first | second
            return try formatResult(of: result)
        } catch {
            return "-1"
        }
    }
    
    static func NOR(firstNumber: String, secondNumber: String) -> String {
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = ~(first | second)
            return try formatResult(of: result)
        } catch {
            return "-1"
        }
    }
    
    static func XOR(firstNumber: String, secondNumber: String) -> String {
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = first ^ second
            return try formatResult(of: result)
        } catch {
            return "-1"
        }
    }
    
    static func NOT(firstNumber: String) -> String {
        do {
            let first = try formatInput(firstNumber)
            let result = ~first
            return try formatResult(of: result)
        } catch {
            return "-1"
        }
    }
    
    static func shiftLeft(firstNumber: String, secondNumber: String) -> String {
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = first << second
            return try formatResult(of: result)
        } catch {
            return "-1"
        }
    }
    
    static func shiftRight(firstNumber: String, secondNumber: String) -> String {
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = first >> second
            return try formatResult(of: result)
        } catch {
            return "-1"
        }
    }
    
    static func formatInput(_ input: String) throws -> Int {
        guard input.count <= 8,
            var number = Int(input, radix: 2) else {
            throw CalculatorError.outOfRangeInput
        }
        
        if number > 128 {
            number -= 1
            number ^= 255
            number *= -1
        }
        
        return number
    }
    
    static func formatResult(of result: Int) throws -> String {
        var result = result
        if result >= 128 {
            throw CalculatorError.outOfRangeInput
        } else if result < 0 {
            result = 1 << 8 + result
        }
        return String(result, radix: 2)
    }
    
}
