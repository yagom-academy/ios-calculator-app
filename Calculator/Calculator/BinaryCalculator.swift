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
    
    private func convertBinaryToDecimal(_ input: String) -> Int {
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
        let first = convertBinaryToDecimal(firstNumber)
        let second = convertBinaryToDecimal(secondNumber)
        
        let result = first + second
        
        return formattedResult(of: result)
    }
    
    func subtract(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertBinaryToDecimal(firstNumber)
        let second = convertBinaryToDecimal(secondNumber)
        
        let result = first &- second
        return formattedResult(of: result)
    }
    
    func AND(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertBinaryToDecimal(firstNumber)
        let second = convertBinaryToDecimal(secondNumber)
        
        let result = first & second
        return formattedResult(of: result)
    }
    
    func NAND(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertBinaryToDecimal(firstNumber)
        let second = convertBinaryToDecimal(secondNumber)
        
        let result = ~(first & second)
        return formattedResult(of: result)
    }
    
    func OR(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertBinaryToDecimal(firstNumber)
        let second = convertBinaryToDecimal(secondNumber)
        
        let result = first | second
        return formattedResult(of: result)
    }
    
    func NOR(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertBinaryToDecimal(firstNumber)
        let second = convertBinaryToDecimal(secondNumber)
        
        let result = ~(first | second)
        return formattedResult(of: result)
    }
    
    func XOR(firstNumber: String, secondNumber: String) throws -> String? {
        let first = convertBinaryToDecimal(firstNumber)
        let second = convertBinaryToDecimal(secondNumber)
        
        let result = first ^ second
        return formattedResult(of: result)
    }
    
    func NOT(firstNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2) else {
            throw CalculatorError.invalidInput
        }
        
        // 하위 8비트를 bitmask
        let bitmasker = ~0 - (1<<8 - 1)
        var result = ~(bitmasker ^ first)

        if result >= 256 {
            result %= 256
        }
        
        return String(result, radix: 2)
    }
    
    func shiftLeft(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2) else {
            throw CalculatorError.invalidInput
        }
        let second = convertBinaryToDecimal(secondNumber)
        
        let result = first << second
        return formattedResult(of: result)
    }
    
    func shiftRight(firstNumber: String, secondNumber: String) throws -> String? {
        guard let first = Int(firstNumber, radix: 2) else {
            throw CalculatorError.invalidInput
        }
        let second = convertBinaryToDecimal(secondNumber)
        
        let result = first >> second
        return formattedResult(of: result)
    }
    
    private func formattedResult(of result: Int) -> String {
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
