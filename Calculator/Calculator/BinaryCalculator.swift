//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by Neph on 2021/03/23.
//


final class BinaryCalculator: Computable, Resettable {
    
    struct StackForBinaryCalculator {
        var number: String
        var operatorType: Operator
    }
    
    var stack = Stack<StackForBinaryCalculator>()
    
    init() {
        reset()
    }
    
    func convertToBinary(_ input: String) -> Int {
        guard input.count <= 8,
            var number = Int(input, radix: 2) else {
            return -1
        }
        
        if number == 128 {
            return -1
        } else if number > 128 {
            number -= 1
            number ^= 255
            number *= -1
        }
        
        return number
    }
    
    func add(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertToBinary(firstNumber)
        let second = convertToBinary(secondNumber)
        
        let result = first + second
        
        return formattedResult(of: result)
    }
    
    func subtract(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertToBinary(firstNumber)
        let second = convertToBinary(secondNumber)
        
        let result = first &- second
        return String(result, radix: 2)
    }
    
    func AND(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertToBinary(firstNumber)
        let second = convertToBinary(secondNumber)
        
        let result = first & second
        return String(result, radix: 2)
    }
    
    func NAND(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertToBinary(firstNumber)
        let second = convertToBinary(secondNumber)
        
        let result = ~(first & second)
        return String(result, radix: 2)
    }
    
    func OR(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertToBinary(firstNumber)
        let second = convertToBinary(secondNumber)
        
        let result = first | second
        return String(result, radix: 2)
    }
    
    func NOR(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertToBinary(firstNumber)
        let second = convertToBinary(secondNumber)
        
        let result = ~(first | second)
        return String(result, radix: 2)
    }
    
    func XOR(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertToBinary(firstNumber)
        let second = convertToBinary(secondNumber)
        
        let result = first ^ second
        return String(result, radix: 2)
    }
    
    func NOT(firstNumber: String) throws -> String? {
        guard let first = Int(firstNumber) else {
            return "-1"
        }
        var result = ~first
        
        result ^= (~0 - 255)
        
        return String(result, radix: 2)
    }
    
    func shiftLeft(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertToBinary(firstNumber)
        let second = convertToBinary(secondNumber)
        
        let result = first << second
        return String(result, radix: 2)
    }
    
    func shiftRight(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertToBinary(firstNumber)
        let second = convertToBinary(secondNumber)
        
        let result = first >> second
        return String(result, radix: 2)
    }
    
    func formattedResult(of result: Int) -> String {
        var result = result
        if result >= 128 {
            result %= 128
        } else if result < 0 {
            result = 1 << 8 + result
        }
        return String(result, radix: 2)
    }
    
    func reset() {
        stack.reset()
    }
    
}
