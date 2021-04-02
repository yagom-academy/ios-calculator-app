//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by Neph on 2021/03/23.
//
import Foundation

final class DecimalCalculator: Computable {
    
    static func add(firstNumber: String, secondNumber: String) -> String {
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = round(Double(first + second) * 1e9) / 1e9
            return try formatResult(of: result)
        } catch {
            return "FormatFailed"
        }
    }
    
    static func subtract(firstNumber: String, secondNumber: String) -> String {
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = round(Double(first - second) * 1e9) / 1e9
            return try formatResult(of: result)
        } catch {
            return "FormatFailed"
        }
    }
    
    static func multiply(firstNumber: String, secondNumber: String) -> String {
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = round(Double(first * second) * 1e9) / 1e9
            return try formatResult(of: result)
        } catch {
            return "FormatFailed"
        }
    }
    
    static func divide(firstNumber: String, secondNumber: String) -> String {
        
        do {
            let first = try formatInput(firstNumber)
            let second = try formatInput(secondNumber)
            let result = round(Double(first / second) * 1e9) / 1e9
            return try formatResult(of: result)
        } catch {
            return "FormatFailed"
        }
        
    }
    
    static func formatInput(_ userInput: String) throws -> Double {
        guard let input = Double(userInput) else {
            throw CalculatorError.formatError
        }
        return input
    }
    
    static func formatResult(of result: Double) throws -> String {
        var result = result
        
        if result >= 1e9 {
            result = result.truncatingRemainder(dividingBy: 1e9)
        }
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 9
        
        guard let formattedResult = formatter.string(from: NSNumber(value: result)) else {
            throw CalculatorError.formatError
        }

        return formattedResult
    }
    
}
