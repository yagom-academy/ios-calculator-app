//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by Neph on 2021/03/23.
//


final class BinaryCalculator: Computable, Resettable {
    
    struct stackForBinaryCalculator {
        var number: String
        var operatorType: Operator
    }
    
    var stack = Stack<stackForBinaryCalculator>()
    
    init() {
        reset()
    }
    
    func add(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2),
              let second = Int(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first &+ second
        return formattedResult(of: result)
    }
    
    func subtract(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2),
              let second = Int(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first &- second
        return formattedResult(of: result)
    }
    
    func AND(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2),
              let second = Int(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first & second
        return formattedResult(of: result)
    }
    
    func NAND(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2),
              let second = Int(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = ~(first & second)
        return formattedResult(of: result)
    }
    
    func OR(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2),
              let second = Int(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first | second
        return formattedResult(of: result)
    }
    
    func NOR(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2),
              let second = Int(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = ~(first | second)
        return formattedResult(of: result)
    }
    
    func XOR(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2),
              let second = Int(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first ^ second
        return formattedResult(of: result)
    }
    
    func NOT(firstNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = ~first
        return formattedResult(of: result)
    }
    
    func shiftLeft(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2),
              let second = Int(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first << second
        return formattedResult(of: result)
    }
    
    func shiftRight(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2),
              let second = Int(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first >> second
        return formattedResult(of: result)
    }
    
    private func formattedResult(of result: Int) -> String {
        var result = result
        if result >= 256 {
            result %= 256
        } else if result < 0 {
            result = 1 << 8 + result
        }
        return String(result, radix: 2)
    }
    
    func reset() {
        stack.reset()
    }
    
}
