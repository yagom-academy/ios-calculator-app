//
//  DecimalCalculator.swift
//  Calculator
//
//  Created by Neph on 2021/03/23.
//
import Foundation

final class DecimalCalculator: Calculator {
    
    var numberStack = Stack<Double>()
    var operatorStack = Stack<Operator>()
    static var shared = DecimalCalculator()
    
    func multiply(firstNumber: Double, secondNumber: Double) -> Double {
        return round(Double(firstNumber * secondNumber) * 1e9) / 1e9
    }
    
    func divide(firstNumber: Double, secondNumber: Double) -> Double {
        return round(Double(firstNumber / secondNumber) * 1e9) / 1e9
    }
    
    func formatInput(_ userInput: String) throws -> Double {
        guard let input = Double(userInput) else {
            throw CalculatorError.formatError
        }
        return input
    }
    
    func formatResult(of result: Double) throws -> String {
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
    
    func reset() {
        numberStack.reset()
        operatorStack.reset()
    }
    
}
