//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by Neph on 2021/03/23.
//


class BinaryCalculator: Computable, Resettable {
    
    struct stackForBinaryCalculator {
        var number: String
        var operatorType: Operator
    }
    
    var stack = Stack<stackForBinaryCalculator>()
    
    init() {
        reset()
    }
    
    func add(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = UInt8(firstNumber, radix: 2),
              let second = UInt8(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first &+ second
        return String(result, radix: 2)
    }
    
    func subtract(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = UInt8(firstNumber, radix: 2),
              let second = UInt8(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first &- second
        return String(result, radix: 2)
    }
    
    func AND(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = UInt8(firstNumber, radix: 2),
              let second = UInt8(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first & second
        return String(result, radix: 2)
    }
    
    func NAND(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = UInt8(firstNumber, radix: 2),
              let second = UInt8(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = ~(first & second)
        return String(result, radix: 2)
    }
    
    func OR(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = UInt8(firstNumber, radix: 2),
              let second = UInt8(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first | second
        return String(result, radix: 2)
    }
    
    func NOR(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = UInt8(firstNumber, radix: 2),
              let second = UInt8(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = ~(first | second)
        return String(result, radix: 2)
    }
    
    func XOR(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = UInt8(firstNumber, radix: 2),
              let second = UInt8(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first ^ second
        return String(result, radix: 2)
    }
    
    func NOT(firstNumber: String) throws -> String? {
        guard let first = UInt8(firstNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = ~first
        return String(result, radix: 2)
    }
    
    func shiftLeft(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = UInt8(firstNumber, radix: 2),
              let second = UInt8(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first << second
        return String(result, radix: 2)
    }
    
    func shiftRight(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = UInt8(firstNumber, radix: 2),
              let second = UInt8(secondNumber, radix: 2) else {
            throw CalculatorError.fatalError
        }
        
        let result = first >> second
        return String(result, radix: 2)
    }
    
    func reset() {
        stack.reset()
    }
    
}
