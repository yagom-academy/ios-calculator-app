//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by Neph on 2021/03/23.
//
import Foundation

final class DecimalCalculator: Computable, Resettable {
    
    struct stackForDecimalCalculator {
        var number: String
        var operatorType: Operator
    }
    
    var stack = Stack<stackForDecimalCalculator>()
    
    func add(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            throw CalculatorError.fatalError
        }
        
        let result = first + second
        return formattedResult(of: result)
    }
    
    func subtract(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            throw CalculatorError.fatalError
        }
        
        let result = first - second
        return formattedResult(of: result)
    }
    
    func multiply(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            throw CalculatorError.fatalError
        }
        
        let result = first * second
        return formattedResult(of: result)
    }
    
    func divide(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            throw CalculatorError.fatalError
        }
        
        let result = first / second
        return formattedResult(of: result)
    }
    
    private func formattedResult(of result: Double) -> String? {
        var result = result
        if result >= 1e9 {
            result = result.truncatingRemainder(dividingBy: 1e9)
        }
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 9
        
        return formatter.string(from: NSNumber(value: result))
    }
    
    func reset() {
        stack.reset()
    }
    
}
